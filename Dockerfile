# Базовий образ Python
FROM python:3.12-slim

# Встановлення системних залежностей
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Встановлення Poetry
ENV POETRY_HOME="/opt/poetry"
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python3 -

# Встановлення робочого каталогу
WORKDIR /app

# Копіюємо тільки залежності для швидкого кешування
COPY pyproject.toml poetry.lock* ./

# Встановлюємо залежності без ізоляції віртуального середовища
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi --no-root

# Копіюємо залишок проєкту
COPY . .

# Відкриваємо порт
EXPOSE 3000

# Запуск сервера
CMD ["python", "main.py"] 