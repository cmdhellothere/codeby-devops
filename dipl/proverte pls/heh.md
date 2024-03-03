Для работы с Yandex Cloud необходимо задать переменные окружения :

```bash
export ACCESS_KEY="YCA**"
export SECRET_KEY="YCOt**"
export ANSIBLE_HOST_KEY_CHECKING=False
```

Далее перечислены шаги и иллюстрации запуска и работы стенда.

# 1 Клонируем репозиторий

Копируем папку dipl из текущего репозитория.

# 2 Переходим в директорию terraform клонированного репозитория и запускаем:

```bash
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY" 
```

# 3 Запускаем terraform на создание инфраструктуры и подготовки ansible playbook'ов для стенда:

```bash
terraform apply --auto-approve
```

# 4 Настраиваем подключение xrdp по гайду из статьи [Статья](https://nikolaymatrosov.medium.com/rdp-на-ubuntu-в-yandex-cloud-c9d7870a47cc)

# 5 После окончания запуска ВМ и инициализации служб переходим к проверке работы сервисов

[Папка с картинками](https://github.com/cmdhellothere/codeby-devops/tree/main/dipl/images) 

# 6 Выполнить команду, для удаления инфраструктуры

```bash
terraform destroy --auto-approve
```

