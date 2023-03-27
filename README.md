# Загадка Эйнштейна

Задачи Эйнштейна - это класс логических задач, сформулированных как ряд утверждений о некоторых сущностях. Утверждения формируют неполное описание этих сущностей, задача заключается в том, чтобы восстановить полное непротиворечивое описание.

- [Подробнее о задаче Эйнштейна (Википедия)](https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B3%D0%B0%D0%B4%D0%BA%D0%B0_%D0%AD%D0%B9%D0%BD%D1%88%D1%82%D0%B5%D0%B9%D0%BD%D0%B0)
- [Статья с алгоритмом решения (pdf)](https://web.archive.org/web/20120118033508/http://window.edu.ru/window_catalog/files/r24338/2003_6_84.pdf)

## Клонирование репозитория

Чтобы склонировать репозиторий, нужно запустить Glamorous Toolkit, открыть новую страницу Playground и выполнить в ней следующий код:

```smalltalk
Metacello new
	baseline: 'EwcZebraRiddle';
	repository: 'github://nergal-perm/st-zebra-riddle:master/src';
	load.
```


В результате в образ будет загружен код из ветки master репозитория вместе с базой знаний по проекту.