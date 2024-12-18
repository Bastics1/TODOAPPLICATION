<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
        .rounded-input {
            border-radius: 0.5rem;
        }
        .button-200 {
            width: 200px; 
        }
        .date-input {
            width: 300px; 
        }
    </style>
</head>
<body class="container">
    <h1>TODOAPP</h1>
    <hr>
    <#if user.email??>
        <h3>Имя пользователя: <i>${user.name}</i></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-danger button-200 mb-2">Выйти</button> <!-- Изменено на кнопку Bootstrap -->
        </form>
        <hr>
        <div>
            <h4>Создание задачи</h4>
        </div>
        <form action="/task/create" method="post">
            <div class="mb-3">
                <label for="title" class="form-label">Название задачи:</label>
                <input type="text" class="form-control rounded-input" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Описание задачи:</label>
                <input type="text" class="form-control rounded-input" id="description" name="description" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Дата:</label>
                <input type="date" class="form-control rounded-input date-input" id="date" name="date" required> 
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="d-flex flex-column gap-2">
                <button type="submit" class="btn btn-primary button-200">Добавить задачу</button> 
            </div>
        </form>
        <hr>
        <form action="/" method="get">
            <div class="mb-3">
                <label for="searchTitle" class="form-label">Поиск по названию задачи:</label>
                <input type="text" class="form-control rounded-input" id="searchTitle" name="title">
            </div>
            <!-- Установлена ширина кнопки поиска -->
            <button type="submit" class="btn btn-secondary button-200">Поиск</button> 
        </form>
        <hr>
        <h4>Задачи</h4>
        <#list tasks as task>
            <#if task.user.id == user.id> 
                <div class="mb-2">
                    <p><b>${task.title}</b> (${task.date}) | 
                    <a href="/task/${task.id}">Подробнее...</a></p>
                </div>
            </#if>
        </#list>
    <#else>
        <div class="d-grid gap-2">  
            <a href="/login" class="btn btn-primary button-200">Войти</a>
            <a href="/registration" class="btn btn-secondary button-200">Регистрация</a>
        </div>
    </#if>  
</body>
</html>
