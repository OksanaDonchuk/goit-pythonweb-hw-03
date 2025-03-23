# goit-pythonweb-hw-03
**PythonWeb. HW_3**

## Технічний опис завдання

За аналогією з розглянутим прикладом у конспекті, створіть веб-додаток з
маршрутизацією для двох `html` сторінок: `index.html` та `message.html`.

Також:

- Обробіть під час роботи програми статичні ресурси: `style.css`, `logo.png`;
- Організуйте роботу з формою на сторінці `message.html`;
- У разі виникнення помилки `404 Not Found` повертайте сторінку `error.html`
- Ваша програма працює на порту `3000`

При роботі з формою отриманий байт-рядок перетворюємо у словник і зберігаємо
його в json файл `data.json` в директорію `storage`.

Формат запису файлу `data.json` наступний:

```json
{
  "2022-10-29 20:20:58.020261": {
    "username": "krabaton",
    "message": "First message"
  },
  "2022-10-29 20:21:11.812177": {
    "username": "Krabat",
    "message": "Second message"
  }
}
```

Де ключ кожного повідомлення - це час отримання повідомлення: `datetime.now()`.
Тобто кожне нове повідомлення від веб-програми дописується до файлу
`storage/data.json` з часом отримання.

Додайте маршрут `/read` при звертанні до якого буде сформована інформаційна
сторінка. Ця сторінка повинна бути шаблоном Jinja2. Вона повинна виводити всі
збереженні сповіщення з файлу `data.json`.

## Додаткове завдання

Це додаткове завдання і його можна не виконувати для здачі цього домашнього
завдання.

1. Створіть Dockerfile та запустіть ваш додаток як Docker-контейнер.
2. За допомогою механізму voluemes, зберігайте дані з storage/data.json не
   всередині контейнера.
