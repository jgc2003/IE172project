import dash
import dash_bootstrap_components as dbc
from dash import Input, Output, State, dcc, html
from dash.exceptions import PreventUpdate

from app import app
from apps.dbconnect import getDataFromDB, modifyDB

layout = html.Div(
    [
        html.H2('va Details'), # Page Header
        html.Hr(),
        dbc.Alert(id='vaprofile_alert', is_open=False), # For feedback purposes
        dbc.Form(
            [
                dbc.Row(
                    [
                        dbc.Label("Title", width=1),
                        dbc.Col(
                            dbc.Input(
                                type='text', 
                                id='vaprofile_title',
                                placeholder="Title"
                            ),
                            width=5
                        )
                    ],
                    className='mb-3'
                ),
                dbc.Row(
                    [
                        dbc.Label("info", width=1),
                        dbc.Col(
                            html.Div(
                                dcc.Dropdown(
                                    id='vaprofile_info',
                                    placeholder='info'
                                ),
                                className='dash-bootstrap'
                            ),
                            width=5,
                        )
                    ],
                    className='mb-3'
                ),
                dbc.Row(
                    [
                        dbc.Label("Release Date", width=1),
                        dbc.Col(
                            dcc.DatePickerSingle(
                                id='vaprofile_releasedate',
                                placeholder='Release Date',
                                month_format='MMM Do, YY',
                            ),
                            width=5, 
                            className='dash-bootstrap'
                        )
                    ],
                    className='mb-3'
                ),

            ]
        ),
          dbc.Button(
            'Submit',
            id='vaprofile_submit',
            n_clicks=0 # Initialize number of clicks
        ),
        dbc.Modal( # Modal = dialog box; feedback for successful saving.
            [
                dbc.ModalHeader(
                    html.H4('Save Success')
                ),
                dbc.ModalBody(
                    'Message here! Edit me please!'
                ),
                dbc.ModalFooter(
                    dbc.Button(
                        "Proceed",
                        href='/vas/va_management' # Clicking this would lead to a change of pages
                    )
                )
            ],
            centered=True,
            id='vaprofile_successmodal',
            backdrop='static' # Dialog box does not go away if you click at the background
        )
    ]
)

@app.callback(
    [
        Output('vaprofile_info', 'options')
    ],
    [
        Input('url', 'pathname')
    ]
)
def vaprofile_populateinfos(pathname):
    if pathname == '/vas/va_management_profile':
        sql = """
        SELECT info_name as label, info_id as value
        FROM infos 
        WHERE info_delete_ind = False
        """
        values = []
        cols = ['label', 'value']

        df = getDataFromDB(sql, values, cols)
        # The output must be a dictionary with the following structure
        # options=[
        #     {'label': "Factorial", 'value': 1},
        #     {'label': "Palindrome Checker", 'value': 2},
        #     {'label': "Greeter", 'value': 3},
        # ]

        info_options = df.to_dict('records')
        return [info_options]
    else:
        raise PreventUpdate

        
@app.callback(
    [
        # dbc.Alert Properties
        Output('vaprofile_alert', 'color'),
        Output('vaprofile_alert', 'children'),
        Output('vaprofile_alert', 'is_open'),
        # dbc.Modal Properties
        Output('vaprofile_successmodal', 'is_open')
    ],
    [
        # For buttons, the property n_clicks 
        Input('vaprofile_submit', 'n_clicks')
    ],
    [
        # The values of the fields are States 
        # They are required in this process but they 
        # do not trigger this callback
        State('vaprofile_title', 'value'),
        State('vaprofile_info', 'value'),
        State('vaprofile_releasedate', 'date'),
    ]
)
def vaprofile_saveprofile(submitbtn, title, info, releasedate):
    ctx = dash.callback_context
    # The ctx filter -- ensures that only a change in url will activate this callback
    if ctx.triggered:
        eventid = ctx.triggered[0]['prop_id'].split('.')[0]
        if eventid == 'vaprofile_submit' and submitbtn:
            # the submitbtn condition checks if the callback was indeed activated by a click
            # and not by having the submit button appear in the layout

            # Set default outputs
            alert_open = False
            modal_open = False
            alert_color = ''
            alert_text = ''

            # We need to check inputs
            if not title: # If title is blank, not title = True
                alert_open = True
                alert_color = 'danger'
                alert_text = 'Check your inputs. Please supply the va title.'
            elif not info:
                alert_open = True
                alert_color = 'danger'
                alert_text = 'Check your inputs. Please supply the va info.'
            elif not releasedate:
                alert_open = True
                alert_color = 'danger'
                alert_text = 'Check your inputs. Please supply the va release date.'
            else: # all inputs are valid
                # Add the data into the db

                sql = '''
                    INSERT INTO vas (va_name, info_id,
                        va_release_date, va_delete_ind)
                    VALUES (%s, %s, %s, %s)
                '''
                values = [title, info, releasedate, False]

                modifyDB(sql, values)

                # If this is successful, we want the successmodal to show
                modal_open = True

            return [alert_color, alert_text, alert_open, modal_open]

        else: 
            raise PreventUpdate

    else:
        raise PreventUpdate
