<!DOCTYPE html>
<html>
<head>
    <title>TODOAPP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
      .rounded-input {
        border-radius: 0.5rem;
      }
      
    </style>
       
</head>
<body>
    <div class="container">
        <h1>TODOAPP</h1>
        <hr>
    <div>
        <h4>Авторизация</h4>
     </div>
        <form action="/login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Эл. почта:</label>
                <input type="email" class="form-control rounded-input" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Пароль:</label>
                <input type="password" class="form-control rounded-input" id="password" name="password" required>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="d-flex flex-column gap-2">
                <button type="submit" class="btn btn-primary">Вход</button>
                <a href="/registration" class="btn btn-secondary">Зарегистрироваться</a>
                <a href="/" class="btn btn-light">Назад</a>
            </div>
        </form>
    </div>
    
</body>
</html>