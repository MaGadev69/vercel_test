import reflex as rx
import httpx
from typing import Union
from config.api import PRODUCTOS_ACTIVOS_CANTIDAD

# Constantes
LOADING_MSG = "Cargando..."
ERROR_MSG = "Error"

class StockState(rx.State):
    cantidad_activos: Union[str, int] = LOADING_MSG
    error_message: str = ""

    @rx.event(background=True)
    async def fetch_cantidad_activos(self):
        try:
            async with httpx.AsyncClient() as client:
                response = await client.get(PRODUCTOS_ACTIVOS_CANTIDAD)
                response.raise_for_status()

                data = response.json()
                if not isinstance(data, dict):
                    raise ValueError("Formato de respuesta inválido")
                
                cantidad = data.get("cantidad")
                if not isinstance(cantidad, (int, float)):
                    raise ValueError("Tipo de cantidad inválido")

                async with self:
                    self.cantidad_activos = int(cantidad)
                    self.error_message = ""

        except httpx.HTTPStatusError as e:
            await self._handle_error(f"Error HTTP: {e.response.status_code}", e)
        except httpx.RequestError as e:
            await self._handle_error(f"Error de conexión: {e}", e)
        except Exception as e:
            await self._handle_error(f"Error inesperado: {str(e)}", e)

    async def _handle_error(self, message: str, exception: Exception):
        async with self:
            self.cantidad_activos = ERROR_MSG
            self.error_message = message
        # Aquí podrías usar logging.error en producción
        print(f"Error: {exception}")