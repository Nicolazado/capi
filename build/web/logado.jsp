
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
        <style>

            .container {
                position: fixed; /* Posiciona a lista fixamente */
                top: 20px;       /* Distância do topo */
                right: 20px;     /* Fixa no lado direito */
                width: 400px;
                margin: 50px auto;
                background-color: #A67B5B;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                transition: height 0.3s ease, width 0.3s ease;
                overflow: hidden;
            }
            #taskList {
                max-height: 200px; /* Ajuste conforme necessário */
                overflow-y: auto;  /* Adiciona scroll se necessário */
            }
            #minimizeButton {

                background-color: transparent;
                border: none;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 4px;
                position: absolute;
                top: 2px;
                right: 10px;
            }
            h2 {
                text-align: center;
                color: #FFDBB5;
            }
            input[type="text"] {
                width: 90%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            ul li {
                padding: 10px;
                background-color:#6C4E31;
                color: #FFDBB5;
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 4px;

            }
            ul li span {
                flex-grow: 1;
                color: #FFDBB5;/* Garantir cor visível */
            }
            ul li button {
                background-color: #FFDBB5;
                border: none;
                color: black;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 4px;
                margin-left: 10px;
            }
            ul li button:hover {
                background-color: #A67B5B;
                color: white;
            }
        </style>
    </head>
    <header>
        <div >
            <img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"
                 alt="logo">
        </div>

        <div class="saudacao">
            <p style="color: #6C4E31">
                Seja Bem-Vindo(a), <%= request.getParameter("nome")%>
            </p> 
        </div>
        <div class="container" id="todoContainer">
            <h2>Minha To-Do List</h2>
            <button id="minimizeButton" onclick="toggleMinimize()">Minimizar</button>
            <input type="text" id="taskInput" placeholder="Digite uma nova tarefa">
            <ul id="taskList"></ul>
        </div>

        <script>
            let isMinimized = false;

            function toggleMinimize() {
                const container = document.getElementById('todoContainer');
                const input = document.getElementById('taskInput');
                const taskList = document.getElementById('taskList');
                const minimizeButton = document.getElementById('minimizeButton');

                if (isMinimized) {
                    // Expande a To-Do List
                    input.classList.remove('hidden');
                    taskList.classList.remove('hidden');
                    minimizeButton.textContent = "Minimizar";
                    container.style.height = 'auto';  // Ajusta a altura de acordo com o conteúdo
                    container.style.padding = '20px'; // Restaura o padding original
                    isMinimized = false;
                } else {
                    // Minimiza a To-Do List
                    input.classList.add('hidden');
                    taskList.classList.add('hidden');
                    minimizeButton.textContent = "Expandir";
                    container.style.height = '50px';  // Define altura fixa para minimizar
                    container.style.padding = '10px'; // Diminui o padding ao minimizar
                    isMinimized = true;
                }
            }
            const taskInput = document.getElementById('taskInput');
            const taskList = document.getElementById('taskList');

            taskInput.addEventListener('keypress', function (event) {
                if (event.key === 'Enter') {
                    addTask();
                }
            });

            function addTask() {
                const taskText = taskInput.value.trim();
                if (taskText !== "") {
                    const listItem = document.createElement('li');

                    // Adiciona o texto da tarefa e o botão de remover
                    const taskSpan = document.createElement('span');
                    taskSpan.textContent = taskText;
                    taskSpan.style.color = '#FFDBB5'; // Garantir visibilidade do texto

                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'Remover';
                    removeButton.onclick = function () {
                        taskList.removeChild(listItem);
                    };

                    // Anexa o span e o botão ao li
                    listItem.appendChild(taskSpan);
                    listItem.appendChild(removeButton);

                    // Adiciona o li à lista de tarefas
                    taskList.appendChild(listItem);

                    // Limpa o campo de entrada
                    taskInput.value = "";
                }
            }
        </script>
    </header>
    <nav>
        <a  href="index.html" class="home">HOME</a>
        <a href="garanta.html" class="garanta_sua">GARANTA A SUA</a>
        <a href="salve.html" class="salve_capi">SALVE AS CAPIVARAS</a>
        <a href="contato.html" class="contato">CONTATO</a>
    </nav>
    <hr>

    <div>
        <h2 style="margin: 15px; font-size: 70px; color: #FFDBB5;"class="salve">CAPIVARAS!!!<h2/>
    </div>
    <main>
        <div class="video">
            <iframe width="100%" height="600" src="https://www.youtube.com/embed/SCwcJsBYL3o" title="Dog and Capybara"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="texto">
            <p>As capivaras são os maiores roedores do mundo, e são conhecidas por sua aparência robusta e comportamento tranquilo. Originárias da América do Sul, elas habitam áreas próximas a rios, lagos e pântanos, onde encontram alimento e abrigo. Sua dieta é principalmente herbívora, alimentando-se de gramíneas, plantas aquáticas e frutas. <br>

                Esses animais são altamente sociáveis, vivendo em grupos que podem variar de pequenos bandos a grandes comunidades com dezenas de indivíduos. Essa vida em grupo ajuda a garantir a segurança contra predadores, como jacarés e onças, além de facilitar o cuidado com os filhotes. <br>

                Um fato interessante sobre as capivaras é sua excelente capacidade de natação. Elas possuem membranas entre os dedos, o que lhes permite mover-se com agilidade na água. Quando se sentem ameaçadas, mergulham e podem permanecer submersas por vários minutos, utilizando a vegetação aquática como camuflagem.

            </p>

            <button id="butt" onclick="location.href = 'https://pt.wikipedia.org/wiki/Capivara'">Saiba Mais</button>
        </div>


    </main>
    <hr id="sla">
    <footer>
        <P>All rights reserved to Nicolas Ribeiro © 2024</P>
    </footer>
</body>

</html>
