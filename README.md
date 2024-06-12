# CI/CD Pipeline con Terraform, Ansible y GitHub Actions

Este proyecto demuestra cómo configurar un pipeline de CI/CD para desplegar una aplicación web Python utilizando Terraform y Ansible en tres proveedores de nube: AWS, Azure y Google Cloud Platform (GCP). El pipeline está gestionado por GitHub Actions y permite seleccionar el proveedor de nube a través de un parámetro de entrada.


## Estructura del Proyecto
```
cicd/
├── .github/
│ └── workflows/
│ └── ci-cd.yml
├── ansible/
│ ├── playbook.yml
│ └── inventory
├── terraform/
│ ├── aws/
│ │ ├── main.tf
│ │ └── variables.tf
│ ├── azure/
│ │ ├── main.tf
│ │ └── variables.tf
│ └── gcp/
│ ├── main.tf
│ └── variables.tf
├── app/
│ └── main.py
├── tests/
│ └── test_app.py
├── .flake8
├── requirements.txt
└── README.md
```


## Prerrequisitos

- Cuenta en AWS, Azure y GCP.
- Claves de acceso y configuración de cada proveedor de nube.
- Claves SSH configuradas y añadidas a los secretos de GitHub.
- Python 3.x y pip instalados.


## Configuración del Proyecto

### 1. Clonar el repositorio

```
git clone https://github.com/tu_usuario/cicd.git
```


### 2. Configurar los secretos en GitHub
Ve a la configuración del repositorio en GitHub y añade los siguientes secretos:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AZURE_SUBSCRIPTION_ID
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID
GCP_PROJECT_ID
GCP_CREDENTIALS (contenido del archivo JSON de credenciales)
SSH_PRIVATE_KEY (clave privada SSH)


### 3. Configuración de la Aplicación Web

El archivo app/main.py contiene una aplicación web básica en Flask y 
el archivo tests/test_app.py sirve para las pruebas unitarias.


### 5. Configuración de Terraform y Ansible

La configuración de Terraform y Ansible ya está en su lugar dentro de los directorios terraform y ansible, respectivamente.


### 6. Configuración de GitHub Actions

El archivo .github/workflows/ci-cd.yml ya está configurado para ejecutar el pipeline.


### 7. Ejecución del Pipeline

Ve a la página de acciones de tu repositorio en GitHub.
Selecciona el flujo de trabajo CI/CD Pipeline.
Haz clic en Run workflow.
Selecciona el proveedor de nube (aws, azure, gcp) en el parámetro cloud-provider.
Haz clic en Run workflow.
Detalles del Flujo de Trabajo

El flujo de trabajo realiza las siguientes acciones:

- Test:

  · Clona el repositorio.
  · Configura Python.
  · Instala las dependencias.
  · Ejecuta Flake8 para linting.
  · Ejecuta las pruebas unitarias.


- Deploy:

  · Configura Terraform para el proveedor de nube seleccionado.
  · Inicializa Terraform.
  · Aplica la configuración de Terraform para crear la infraestructura.
  · Extrae la IP de la instancia creada.
  · Genera dinámicamente el archivo de inventario de Ansible.
  · Configura SSH.
  · Ejecuta el playbook de Ansible para desplegar la aplicación web.



### Notas
Asegúrate de tener configuradas las credenciales necesarias para cada proveedor de nube.
Puedes ampliar y personalizar la configuración de Terraform y Ansible según tus necesidades.

El pipeline está diseñado para ser flexible y permite elegir el proveedor de nube en tiempo de ejecución.


### Contribuciones
Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para mejoras y correcciones.
