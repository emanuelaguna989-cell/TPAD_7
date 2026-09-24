import os
import requests
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from dotenv import load_dotenv

load_dotenv()

def obtener_clima(ciudad, api_key):
    """Obtiene la información del clima usando la API de OpenWeather.

    :param ciudad: Nombre de la ciudad (por ejemplo: 'Madrid')
    :param api_key: Tu clave de OpenWeatherMap
    :return: Tupla (temperatura, descripcion) o None si hay un error
    """
    url = f"https://api.openweathermap.org/data/2.5/weather?q={ciudad}&appid={api_key}&lang=es&units=metric"

    try:
        respuesta = requests.get(url, timeout=10)
        if respuesta.status_code == 200:
            datos = respuesta.json()
            temperatura = datos["main"]["temp"]
            descripcion = datos["weather"][0]["description"]
            return (temperatura, descripcion)
        else:
            print(
                f"Error al obtener el clima. Código de estado: {respuesta.status_code}"
            )
            return None
    except Exception as e:
        print(f"Error al realizar la solicitud: {e}")
        return None


def enviar_email(remitente, password, destinatario, asunto, contenido):
    """Envía un correo electrónico usando smtplib (ejemplo con Gmail).

    :param remitente: Dirección de correo del remitente
    :param password: Contraseña o App Password de la cuenta del remitente
    :param destinatario: Dirección de correo del destinatario
    :param asunto: Asunto del correo
    :param contenido: Contenido del correo en texto plano
    """
    # Crear el mensaje
    mensaje = MIMEMultipart()
    mensaje["From"] = remitente
    mensaje["To"] = destinatario
    mensaje["Subject"] = asunto

    # Agregar el contenido en texto plano (UTF-8)
    mensaje.attach(MIMEText(contenido, "plain", "utf-8"))

    try:
        # Conectarnos con el servidor SMTP de Gmail en el puerto 587
        with smtplib.SMTP("smtp.gmail.com", 587) as server:
            server.ehlo()
            server.starttls()
            server.login(remitente, password)
            server.sendmail(remitente, destinatario, mensaje.as_string())
            print("Correo enviado exitosamente.")
    except Exception as e:
        print(f"Error al enviar el correo: {e}")


if __name__ == "__main__":
    # Leer variables desde el archivo .env
    API_KEY = os.getenv("API_KEY")
    CIUDAD = os.getenv("CIUDAD")
    CORREO_REMITENTE = os.getenv("CORREO_REMITENTE")
    CONTRASENA = os.getenv("CONTRASENA")
    CORREO_DESTINATARIO = os.getenv("CORREO_DESTINATARIO")

    # Comprobación básica de variables de entorno
    variables = [
        ("API_KEY", API_KEY),
        ("CIUDAD", CIUDAD),
        ("CORREO_REMITENTE", CORREO_REMITENTE),
        ("CONTRASENA", CONTRASENA),
        ("CORREO_DESTINATARIO", CORREO_DESTINATARIO),
    ]

    missing = [nombre for nombre, valor in variables if valor is None]

    if missing:
        print("Faltan variables de entorno:", ", ".join(missing))
    else:
        # Obtener información del clima
        resultado_clima = obtener_clima(CIUDAD, API_KEY)

        if resultado_clima:
            temperatura, descripcion = resultado_clima

            # Crear contenido del correo
            contenido = f"""Hola,

El clima actual en {CIUDAD} es:
- Temperatura: {temperatura}°C
- Descripción: {descripcion}

Automatización hecha por Emmanuel
¡Que tengas un excelente día!
"""
            # Enviar correo
            enviar_email(
                CORREO_REMITENTE,
                CONTRASENA,
                CORREO_DESTINATARIO,
                f"Reporte de Clima: {CIUDAD}",
                contenido,
            )
        else:
            print("No se pudo obtener la información del clima.")
