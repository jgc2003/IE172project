import webbrowser
import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.dependencies import Input, Output, State
from dash.exceptions import PreventUpdate

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.layout = dbc.Container([
    dbc.Navbar(
        dbc.Container([
            dbc.NavbarBrand("My App", href="#"),
            dbc.Nav([
                dbc.NavItem(dbc.NavLink("Home", href="#")),
                dbc.NavItem(dbc.NavLink("About", href="#")),
                dbc.NavItem(dbc.NavLink("Contact", href="#"))
            ], className="ml-auto")
        ])
    )
])

if __name__ == '__main__':
    webbrowser.open('http://127.0.0.1:8050/', new=0, autoraise=True)
    app.run_server(debug=False)

layout = html.Div(
    [
        html.H5("CLIENT DATABASE", className="mt-2 mb-2", style={"font-weight": "bold", "font-size": "18px", "color": "#3f587b"}),
        html.Hr(style={"border-color": "white"}),
        dbc.Input(type="search", placeholder="Search", className="mb-2", style={"background-color": "#fff", "border-radius": "20px", "font-style": "italic"}),
        html.Ul(
            [
                dcc.Link("American Gymnastics Academy", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Fusion Athletic Center", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("GymTek Academy", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Gymnastics World of Georgia", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Head Over Heels", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("I-Prevail Supplements", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Ocean State School of Gymnastics", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Stars and Stripes Athletics", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Spotlight Acro and Cheer", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
                dcc.Link("Top Notch Training Gym", href="#", style={"color": "#3f587b", "padding": "5px", "text-decoration": "none", "display": "block"}),
            ],
            className="list-unstyled",
            style={"color": "#3f587b", "font-size": "15px", "line-height": "1.8"}
        ),
        html.Hr(style={"border-color": "#3f587b"}),
        dbc.Button("Add a New Client", color="primary", className="w-100 mt-1", style={"border-radius": "20px"}),
    ],
    style={
        "background-color": "#c3d1e4",
        "padding": "20px",
        "height": "100vh",
        "width": "300px",
        "position": "fixed",  # Keeps sidebar fixed
        "top": "110px",  # Adjust to the height of the navbar (change if necessary)
        "left": "0",  # Sidebar on the left
        "z-index": "1",  # Ensures it stays on top of the main content
        "overflow-y": "auto",  # Allows scrolling if content exceeds height
        "color": "white",
    },
)