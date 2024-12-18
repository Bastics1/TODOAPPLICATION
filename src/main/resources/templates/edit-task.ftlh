<!DOCTYPE html>
<html>
<head>
    <title>Редактировать задачу</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
        
    </style>
</head>
<body>
    <div class="container">
    <h1>TODOAPP</h1>
    <hr>
        <h1>Редактировать задачу</h1>
             
        <form action="/task/edit/${task.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            
            <div class="mb-3">
                <label for="title" class="form-label">Название задачи:</label>
                <input type="text" id="title" name="title" class="form-control rounded-input" value="${task.title}" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Описание задачи:</label>
                <textarea id="description" name="description" class="form-control rounded-input" required>${task.description}</textarea>
            </div>

            <div class="mb-3">
                <label for="date" class="form-label">Дата задачи:</label>
                <input type="date" id="date" name="date" class="form-control rounded-input" value="${task.date}" required>
            </div>

            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
        </form>

        <a href="/task/${task.id}" class="btn btn-light mt-2">Назад к задаче</a>
    </div>

</body>
</html>
