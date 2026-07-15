# 🛠️ C Project Templates

Универсальный набор шаблонов для быстрого старта C-проектов. Включает в себя **3 варианта `Makefile`** под разные задачи, интеграцию с библиотекой юнит-тестирования `check`, генерацию отчётов покрытия кода (`gcov`/`lcov`), проверку на утечки памяти (`valgrind`) и готовые конфигурации для VS Code.

## ✨ Возможности

- 📦 **3 готовых шаблона**: от простого скрипта до полноценного production-ready проекта.
- 🏗️ Сборка статических библиотек (`.a`).
- 🧪 Юнит-тестирование с использованием библиотеки [`check`](https://libcheck.github.io/check/).
- 📊 Генерация HTML-отчёта покрытия кода (Code Coverage).
- 🛡️ Проверка на утечки памяти через `valgrind`.
- 💅 Автоматическое форматирование кода через `clang-format`.
- ⚙️ Готовая конфигурация IntelliSense для VS Code (macOS / Apple Silicon).

## 📋 Требования

Для работы вам понадобятся:
- Компилятор `gcc` или `clang`
- `make`
- Библиотека `check`
- `lcov` (для генерации отчётов покрытия)
- `valgrind` (для проверки утечек памяти)
- `clang-format` (для форматирования)

**Установка зависимостей (macOS / Homebrew):**
```bash
brew install check lcov clang-format valgrind
```

**Установка зависимостей (Ubuntu / Debian):**
```bash
sudo apt-get install check lcov clang-format valgrind
```


## 📂 Структура репозитория
```text
.
├── README.md                 # Это описание
├── .clang-format             # Единый стиль форматирования для всех проектов
├── .editorconfig             # Настройки отступов и кодировки для редакторов
├── templates/                # 📁 Папка с шаблонами Makefile
│   ├── Makefile.simple       # 1. Простой (только компиляция main.c)
│   ├── Makefile.lib          # 2. Библиотека (сборка .a без тестов)
│   └── Makefile.full         # 3. Полный (библиотека + main + check + gcov + valgrind)
└── .vscode/
    └── c_cpp_properties.json # Настройки IntelliSense для VS Code
```

## 🚀 Как использовать
1. Выберите подходящий шаблон из папки templates/ в зависимости от вашей задачи.
2. Скопируйте его в корень вашего нового проекта и переименуйте в Makefile.
3. Откройте Makefile и замените переменные PROJECT_NAME (или SRC) на реальные названия ваших файлов.

## 📊 Сравнение шаблонов
| Шаблон | Когда использовать | Поддерживаемые команды make | 
| :--- | :---: | ---: |
| Makefile.simple | Простые алгоритмы, скрипты, задачи без библиотек | all, clean, fclean, rebuild | 
| Makefile.lib | Создание переиспользуемых модулей и библиотек (.a) | all, clean, fclean, rebuild | 
| Makefile.full | Финальные проекты, pet-проекты, где важны тесты и качество кода | all, main, test, valgrind, gcov_report, format, clean, fclean, rebuild | 

## 💻 Настройка VS Code
В репозиторий добавлена папка .vscode с файлом c_cpp_properties.json. 
Он настроен для macOS (Apple Silicon) и включает пути к заголовочным файлам библиотеки check (/opt/homebrew/opt/check/include), чтобы IntelliSense корректно подсвечивал код и не выдавал ошибок при импорте check.h.
Если вы используете другую ОС или архитектуру, просто обновите compilerPath и includePath в этом файле под себя.

