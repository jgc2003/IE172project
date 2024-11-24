import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.exceptions import PreventUpdate

from app import app
from apps.dbconnect import getDataFromDB, modifyDB

layout = html.Div(
    [
        html.H2('jobss'), # Page Header
        html.Hr(),
        dbc.Card( # Card Container
            [
                dbc.CardHeader( # Define Card Header
                    [
                        html.H3('Manage jobss')
                    ]
                ),
                dbc.CardBody( # Define Card Contents
                    [
                        html.Div( # Add Movie Btn
                            [
                                # Add movie button will work like a 
                                # hyperlink that leads to another page
                                dbc.Button(
                                    "Add jobs",
                                    href='/jobs/jobs_management_profile'
                                )
                            ]
                        ),
                        html.Hr(),
                        html.Div( # Create section to show list of movies
                            [
                                html.H4('Find jobs'),
                                html.Div(
                                    dbc.Form(
                                        dbc.Row(
                                            [
                                                dbc.Label("Search Title", width=1),
                                                dbc.Col(
                                                    dbc.Input(
                                                        type='text',
                                                        id='jobs_namefilter',
                                                        placeholder='jobs Name'
                                                    ),
                                                    width=5
                                                )
                                            ],
                                        )
                                    )
                                ),
                                html.Div(
                                    "Table with jobss will go here.",
                                    id='jobs_jobslist'
                                )
                            ]
                        )
                    ]
                )
            ]
        )
    ]
)

