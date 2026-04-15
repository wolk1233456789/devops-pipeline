<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Pipeline Control Center</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=JetBrains+Mono&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #05070a;
            --card: rgba(22, 27, 34, 0.8);
            --accent: #3b82f6;
            --success: #238636;
            --border: rgba(255, 255, 255, 0.1);
            --glow: rgba(59, 130, 246, 0.3);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg);
            background-image: radial-gradient(circle at 50% -20%, #1e293b, var(--bg));
            color: #e6edf3;
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container { max-width: 1000px; margin: 0 auto; }

        /* --- Header --- */
        .header { text-align: center; margin-bottom: 50px; }
        .header h1 { font-size: 42px; font-weight: 800; letter-spacing: -1px; }
        .header h1 span { color: var(--accent); text-shadow: 0 0 20px var(--glow); }

        /* --- Flujo Funcional (Lo que pediste) --- */
        .flow-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
            position: relative;
        }

        .flow-card {
            background: var(--card);
            border: 1px solid var(--border);
            padding: 20px;
            border-radius: 16px;
            text-align: center;
            backdrop-filter: blur(10px);
            transition: 0.3s;
            position: relative;
            z-index: 2;
        }

        .flow-card:hover { border-color: var(--accent); transform: translateY(-5px); }

        .flow-icon { font-size: 32px; margin-bottom: 10px; display: block; }
        .flow-title { font-size: 14px; font-weight: 700; color: var(--accent); margin-bottom: 5px; }
        .flow-desc { font-size: 11px; color: #8b949e; line-height: 1.4; }

        /* Flechas conectoras */
        .flow-container::after {
            content: "";
            position: absolute;
            top: 50%; left: 5%; right: 5%;
            height: 2px; background: linear-gradient(90deg, transparent, var(--border), transparent);
            z-index: 1;
        }

        /* --- Terminal y Control --- */
        .main-panel {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
        }

        .console {
            background: #000;
            border-radius: 10px;
            padding: 20px;
            font-family: 'JetBrains Mono', monospace;
            font-size: 13px;
            color: #3fb950;
            height: 200px;
            overflow-y: auto;
            border: 1px solid #30363d;
            margin-top: 20px;
        }

        .btn-deploy {
            width: 100%;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: white; border: none; padding: 18px;
            border-radius: 12px; font-weight: 800; cursor: pointer;
            text-transform: uppercase; letter-spacing: 2px;
            margin-top: 25px; transition: 0.3s;
        }

        .btn-deploy:hover { box-shadow: 0 0 30px var(--glow); filter: brightness(1.1); }

        .infra-info {
            display: flex; justify-content: space-between;
            margin-top: 20px; font-size: 12px; color: #8b949e;
            background: rgba(0,0,0,0.2); padding: 10px; border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Pipeline <span>Automatizado</span></h1>
        <p style="color: #8b949e; margin-top: 10px;">CI/CD | Docker | Jenkins | AWS Cloud</p>
    </div>

    <div class="flow-container">
        <div class="flow-card" id="c1">
            <span class="flow-icon">📂</span>
            <p class="flow-title">CODE</p>
            <p class="flow-desc">Push a GitHub activa el Webhook</p>
        </div>
        <div class="flow-card" id="c2">
            <span class="flow-icon">⚙️</span>
            <p class="flow-title">BUILD</p>
            <p class="flow-desc">Jenkins construye imagen Docker</p>
        </div>
        <div class="flow-card" id="c3">
            <span class="flow-icon">🐳</span>
            <p class="flow-title">PUSH</p>
            <p class="flow-desc">Imagen subida a Docker Hub</p>
        </div>
        <div class="flow-card" id="c4">
            <span class="flow-icon">☁️</span>
            <p class="flow-title">DEPLOY</p>
            <p class="flow-desc">AWS EC2 actualiza contenedor</p>
        </div>
    </div>

    <div class="main-panel">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <h2 style="font-size: 18px;">Control de Operaciones</h2>
            <span style="color: var(--success); font-size: 12px; font-weight: 700;">● INSTANCIA EC2: RUNNING</span>
        </div>

        <div class="console" id="console">
            <p>> [READY] Esperando instrucción del usuario...</p>
        </div>

        <button class="btn-deploy" onclick="runPipeline()">Ejecutar Pipeline Completo</button>

        <div class="infra-info">
            <span>REGION: us-east-1</span>
            <span>IP: 54.83.80.60</span>
            <span>ROLLBACK: ACTIVADO</span>
        </div>
    </div>
</div>

<script>
    function addLog(text, color = "#3fb950") {
        const consoleDiv = document.getElementById('console');
        const p = document.createElement('p');
        p.style.color = color;
        p.innerText = `> ${text}`;
        consoleDiv.appendChild(p);
        consoleDiv.scrollTop = consoleDiv.scrollHeight;
    }

    async function runPipeline() {
        // Reset
        document.querySelectorAll('.flow-card').forEach(c => c.style.borderColor = "var(--border)");
        document.getElementById('console').innerHTML = '';

        const steps = [
            { id: 'c1', msg: "GitHub: Cambio detectado. Descargando repositorio..." },
            { id: 'c2', msg: "Jenkins: Validando Dockerfile y compilando binarios..." },
            { id: 'c3', msg: "Docker Hub: Subiendo imagen v1.0.25 exitosamente." },
            { id: 'c4', msg: "AWS: Pulling image y reiniciando contenedor en EC2..." }
        ];

        for (const step of steps) {
            const card = document.getElementById(step.id);
            card.style.borderColor = "var(--accent)";
            card.style.boxShadow = "0 0 15px var(--glow)";
            addLog(step.msg);
            await new Promise(r => setTimeout(r, 1500));
            card.style.borderColor = "var(--success)";
            card.style.boxShadow = "none";
        }

        addLog("HEALTH CHECK: La aplicación está online en el puerto 80.", "#fff");
        addLog("ROLLBACK STATUS: No se detectaron errores. Versión estable.", "#3fb950");
    }
</script>

</body>
</html>
