import reflex as rx
from integracion_minimal_web_page.states.stock_state import StockState


def index() -> rx.Component:
    return rx.el.div(
        rx.el.p(StockState.cantidad_activos),
        rx.cond(
            StockState.error_message != "",
            rx.el.p(StockState.error_message),
            None,
        ),
        on_mount=StockState.fetch_cantidad_activos,
    )


app = rx.App(theme=rx.theme(appearance="light"))
app.add_page(index)