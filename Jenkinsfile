pipeline {
    agent any
    environment {
        TARGET_IP = "54.83.80.60"
        SSH_CRED_ID = "ec2-aws"
        AWS_CRED_ID = "aws-cred"
        IMAGE_NAME = "webapp"
        CONTAINER_NAME = "web"
    }
    stages {
        stage('1. Gestión de Código (Git)') {
            steps {
                git branch: 'main', url: 'https://github.com/wolk1233456789/devops-pipeline.git'
                echo "Código descargado correctamente"
            }
        }
        stage('2. Validación de Infraestructura') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "${env.AWS_CRED_ID}",
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
                echo "Infraestructura validada correctamente"
            }
        }
        stage('3. Despliegue de Contenedores Docker') {
            steps {
                sshagent(["${env.SSH_CRED_ID}"]) {
                    sh """
                        echo "Subiendo archivos a EC2..."
                        scp -o StrictHostKeyChecking=no \
                            -o ConnectTimeout=30 \
                            -o ServerAliveInterval=10 \
                            index.html Dockerfile \
                            ec2-user@${env.TARGET_IP}:/home/ec2-user/

                        echo "Desplegando contenedor en EC2..."
                        ssh -o StrictHostKeyChecking=no \
                            -o ConnectTimeout=30 \
                            -o ServerAliveInterval=10 \
                            ec2-user@${env.TARGET_IP} '
                                export PATH=\$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin
                                cd /home/ec2-user/
                                sudo docker tag webapp:latest webapp:backup || true
                                sudo docker build -t webapp:latest .
                                sudo docker stop web || true
                                sudo docker rm web || true
                                sudo docker run -d -p 80:80 --name web webapp:latest
                                echo "Contenedor desplegado correctamente"
                            '
                    """
                }
            }
        }
        stage('4. Health Check Final') {
            steps {
                echo "Verificando aplicación en http://${env.TARGET_IP}"
                sleep 10
                sshagent(["${env.SSH_CRED_ID}"]) {
                    sh """
                        for i in 1 2 3 4 5
                        do
                            STATUS=\$(ssh -o StrictHostKeyChecking=no \
                                -o ConnectTimeout=30 \
                                ec2-user@${env.TARGET_IP} \
                                "curl -s -o /dev/null -w '%{http_code}' http://localhost:80")
                            if [ "\$STATUS" = "200" ]; then
                                echo "Aplicación OK - HTTP 200"
                                exit 0
                            else
                                echo "Esperando... intento \$i - HTTP \$STATUS"
                                sleep 5
                            fi
                        done
                        echo "Health Check fallido"
                        exit 1
                    """
                }
            }
        }
    }
    post {
        success {
            echo "============================================"
            echo "PIPELINE EXITOSO"
            echo "App corriendo en http://${env.TARGET_IP}"
            echo "============================================"
        }
        failure {
            echo "============================================"
            echo "FALLO DETECTADO - Ejecutando rollback..."
            echo "============================================"
            sshagent(["${env.SSH_CRED_ID}"]) {
                sh """
                    ssh -o StrictHostKeyChecking=no \
                        -o ConnectTimeout=30 \
                        ec2-user@${env.TARGET_IP} '
                            sudo docker stop web || true
                            sudo docker rm web || true
                            sudo docker run -d -p 80:80 \
                                --name web webapp:backup \
                                || echo "Sin version backup disponible"
                            echo "Rollback completado"
                        '
                """
            }
        }
    }
}
