import requests
import ctypes
from PIL import Image
from io import BytesIO

def download_image(url, filename):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            with open(filename, 'wb') as f:
                f.write(response.content)
            return True
        else:
            print("Failed to download image. Status code:", response.status_code)
            return False
    except Exception as e:
        print("Error downloading image:", e)
        return False

def set_wallpaper(image_path):
    try:
        SPI_SETDESKWALLPAPER = 20
        ctypes.windll.user32.SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, image_path, 3)
        print("Wallpaper set successfully.")
    except Exception as e:
        print("Failed to set wallpaper:", e)

def set_screen_resolution(width, height):
    try:
        user32 = ctypes.windll.user32
        user32.ChangeDisplaySettingsW(None, 0)
        dm = ctypes.c_int * 16
        devmode = dm()
        ctypes.windll.user32.EnumDisplaySettingsW(None, -1, ctypes.byref(devmode))
        devmode[0] = ctypes.sizeof(devmode)
        devmode[1] = width
        devmode[2] = height
        devmode[14] = 0
        user32.ChangeDisplaySettingsW(ctypes.byref(devmode), 0)
        print("Screen resolution set to", width, "x", height)
    except Exception as e:
        print("Failed to set screen resolution:", e)

if __name__ == "__main__":
    image_url = "https://img95.pixhost.to/images/527/465978538_sarah-water.jpg"
    image_path = "C:/wallpaper.jpg"
    
    if download_image(image_url, image_path):
        set_wallpaper(image_path)
        set_screen_resolution(1920, 1080)
    else:
        print("Failed to set wallpaper.")
