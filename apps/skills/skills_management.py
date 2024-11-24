import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.exceptions import PreventUpdate

from app import app
from apps.dbconnect import getDataFromDB, modifyDB

layout = html.Div(
    [
        html.H2('skills'), # Page Header
        html.Hr(),
        dbc.Card( # Card Container
            [
                dbc.CardHeader( # Define Card Header
                    [
                        html.H3('Manage skills')
                    ]
                ),
                dbc.CardBody( # Define Card Contents
                    [
                        html.Div( # Add Movie Btn
                            [
                                # Add movie button will work like a 
                                # hyperlink that leads to another page
                                dbc.Button(
                                    "Add skill",
                                    href='/skill/skill_management_profile'
                                )
                            ]
                        ),
                        html.Hr(),
                        html.Div( # Create section to show list of movies
                            [
                                html.H4('Find skill'),
                                html.Div(
                                    dbc.Form(
                                        dbc.Row(
                                            [
                                                dbc.Label("Search Title", width=1),
                                                dbc.Col(
                                                    dbc.Input(
                                                        type='text',
                                                        id='skill_namefilter',
                                                        placeholder='skill Name'
                                                    ),
                                                    width=5
                                                )
                                            ],
                                        )
                                    )
                                ),
                                html.Div(
                                    "Table with skills will go here.",
                                    id='skill_skilllist'
                                )
                            ]
                        )
                    ]
                )
            ]
        )
    ]
)

