<!DOCTYPE html>
<html>
<head>
    <title>TODOAPP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
        .button-200 {
            width: 200px; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TODOAPP</h1>
        <hr>  
        <div>
            <h4>Подробности о задаче</h4>
        </div>

        <b>Название задачи:</b> ${task.title} <br>
        <b>Описание задачи:</b> ${task.description} <br>
        <b>Дата задачи:</b> ${task.date} <br>
        <hr>

        <div class="d-flex flex-column gap-0">
            <form action="/task/delete/${task.id}" method="post"> 
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-danger button-200 mb-2">Удалить задачу</button>
            </form>
            <a href="/task/edit/${task.id}" class="btn btn-secondary button-200 mb-2">Редактировать задачу</a>
            <a href="/" class="btn btn-light button-200">Назад к задачам</a>
        </div>    
    </div>
</body>
</html>
