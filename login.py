
import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.dependencies import Input, Output, State
from dash.exceptions import PreventUpdate

from app import app  # Importing the Dash app instance

# Define the layout for the login page
layout = dbc.Container([
    dbc.Row(html.Br()),
    dbc.Row(html.Br()),
    dbc.Row(html.Br()),
    dbc.Row(html.Br()),
    dbc.Row(html.Br()),
    dbc.Row([
        dbc.Col([
            dbc.Row([
                dbc.Col(dbc.CardImg(src="https://d1hbpr09pwz0sk.cloudfront.net/logo_url/synergy-virtual-allies-80968c75",
                                    top=True, style={"height": "128px", "width": "128px", "display": "block", "margin-left": "auto", "margin-right": "auto"})),
            ]),
            dbc.Row([
                dbc.Col(dbc.Card(
                    dbc.CardBody([
                        dbc.Row(dbc.Col(html.H2("HELLO, "))),
                        dbc.Row(dbc.Col(html.H2("WELCOME BACK!"))),
                        html.Br(),
                        dbc.Row(dbc.Col(dbc.Input(id="username-input", type="text", placeholder="Username"))),
                        html.Br(),
                        dbc.Row(dbc.Col(dbc.Input(id="password-input", type="password", placeholder="Password"))),
                        html.Br(),
                        dbc.Row(dbc.Col(dbc.Button("Log in", id="login-button",
                                                    style={'backgroundColor': '#3f587b', 'color': 'white', 'align-items': 'center', 'width': '686.4px', 'font-size': '20px', 'border-radius': '5px', 'justify-content': 'center'}, className="d-flex flex-nowrap"))),
                        html.Br(),
                        dbc.Row(dbc.Col(html.Div(id="login-message")))
                    ])
                ))
            ]),
        ]),
        dbc.Col(dbc.CardImg(src="https://www.edygrad.in/assets/images/resource/edygrad-ecosytem.png",
                            top=True, style={"height": "460px", "width": "475px", "display": "block", "margin-left": "auto", "margin-right": "auto"}))
    ])
])

# Define callback to handle login
@app.callback(
    Output("login-message", "children"),
    Input("login-button", "n_clicks"),
    State("username-input", "value"),
    State("password-input", "value")
)
def handle_login(n_clicks, username, password):
    if n_clicks is None:
        raise PreventUpdate

    # Simple validation logic
    if username == "admin" and password == "1234":
        return dcc.Location(pathname='/home', id='redirect')  # Redirect to home page after successful login
    else:
        return html.Div("Invalid username or password.", style={'color': 'red'})
