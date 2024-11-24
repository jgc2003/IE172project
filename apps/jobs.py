import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.exceptions import PreventUpdate

from app import app

# instead of app.layout, we just use the variable "layout" here
# We cannot really modify the "app" variable here, we only do it in index.py
layout = html.Div(
    [
        html.H2('Welcome to Job Assignments!', style={'textAlign': 'left'}),
        html.Hr(),
        html.Div(
            [
                html.Span(
                    "Through this tab, you can manage the database of Jobs to find the list of jobs and match it to our Virtual Assistants",
                ),
                html.Br(),
                html.Br(),
                html.Span(
                    "<table goes here>",
                    style={'font-style':'italic'}
                ),
            ]
        )
    ]
)