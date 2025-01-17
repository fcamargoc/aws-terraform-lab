## Laboratorio práctico: Desplegar una infraestructura básica en AWS con Terraform, Git, GitHub y GitHub Actions


## Objetivo:

Crear y versionar un proyecto que implemente una infraestructura básica en AWS utilizando Terraform, mientras se automatiza el flujo CI/CD con GitHub Actions.


1. Herramientas necesarias:
* Git: Instalar Git.
* Terraform: Instalar Terraform.
* AWS CLI: Instalar AWS CLI.

2. Configuraciones
* Clona el repositorio.
* Configura tus credenciales de AWS con aws configure.

3. Inicializa el repositorio:

* git init.
* git add.
* git commit -m "Initial commit with Terraform configuration".
* git push -u origin main.

4. Configura los secretos en GitHub:

* Ve a Settings > Secrets and variables > Actions.
* Agrega AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY.

## Prueba el flujo completo, Realiza cambios en los archivos de Terraform, por ejemplo, cambia el tipo de instancia.

5. Sube los cambios al repositorio:
* git add .
* git commit -m "Updated instance type"
* git push origin main

6. Verifica en la pestaña Actions de tu repositorio que se ejecuta el workflow y aplica los cambios.

