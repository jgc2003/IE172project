from urllib.parse import parse_qs, urlparse
import dash
import dash_bootstrap_components as dbc
from dash import dcc, html

from dash import Input, Output, State
from app import app
from dbconnect import getDataFromDB, modifyDB
from dash.exceptions import PreventUpdate

layout = html.Div(
    [
        dcc.Store(id='clientprofile_id', storage_type='memory', data=0),
        dbc.Row(
            [
                dbc.Col(html.H2(id="client_profile_header", style={'font-size': '25px'}), width="auto"),
                dbc.Col(
                    dbc.Button(
                        "Cancel",
                        color="secondary",
                        href="/client_profile",
                        style={
                            "borderRadius": "20px",
                            "fontWeight": "bold",
                            "fontSize": "16px",
                            "marginRight": "10px",
                            "backgroundColor": "#194D62"
                        }
                    ),
                    width="auto"
                ),
            ],
            align="center",
            className="mb-4"
        ),
        
        html.Hr(),
        
        # Form Layout
        dbc.Form(
            [

                # First Name
                dbc.Row(
                    [
                        dbc.Label("First Name", width=2),
                        dbc.Col(
                            dbc.Input(
                                type='text',
                                id='first_name',
                                placeholder='Enter First Name',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),

                # Last Name
                dbc.Row(
                    [
                        dbc.Label("Last Name", width=2),
                        dbc.Col(
                            dbc.Input(
                                type='text',
                                id='last_name',
                                placeholder='Enter Last Name',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),
                
                # Company Name
                dbc.Row(
                    [
                        dbc.Label("Company Name", width=2),
                        dbc.Col(
                            dbc.Input(
                                type='text',
                                id='company_name',
                                placeholder='Enter Company Name',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),

                # Email Address
                dbc.Row(
                    [
                        dbc.Label("Email Address", width=2),
                        dbc.Col(
                            dbc.Input(
                                type='email',
                                id='email_address',
                                placeholder='Enter Email Address',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),
                
                # Date Acquired
                dbc.Row(
                    [
                        dbc.Label("Date Acquired", width=2),
                        dbc.Col(
                            dbc.Input(
                                type='date',
                                id='date_acquired',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),
                
                # Status
                dbc.Row(
                    [
                        dbc.Label("Status", width=2),
                        dbc.Col(
                            dbc.Select(
                                id='status',
                                options=[
                                    {'label': 'ACTIVE', 'value': 'ACTIVE'},
                                    {'label': 'INACTIVE', 'value': 'INACTIVE'}
                                ],
                                placeholder='Select Status',
                                className="form-control",
                                style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                            ),
                            width=8
                        ),
                    ],
                    className="mb-3"
                ),
              
                html.Div(
                    [
                        dbc.Checklist(
                            id='client_profile_delete',
                            options=[dict(value=1, label="Mark as Deleted")],
                            value=[]
                        )
                    ],
                    id='clientprofile_deletediv'
                ),

                dbc.Button(
                    "Submit", 
                    color="primary", 
                    className="mt-3",
                    id='submit_button',
                    style={
                        "borderRadius": "20px",
                        "fontWeight": "bold",
                        "fontSize": "18px",
                        "backgroundColor": "#194D62",
                        "color": "white"
                    },
                )
            ]
        ),
        dbc.Alert(id='submit_alert', is_open=False)
    ],
    className="container mt-4"
)
#Hides Mark as Deleted During Add Mode
@app.callback(
    [
        Output('clientprofile_id', 'data'),
        Output('clientprofile_deletediv', 'className')
    ],
    [Input('url', 'pathname')],
    [State('url', 'search')]
)
def client_profile_load(pathname, urlsearch):
    if pathname == '/client_profile/client_management_profile':
        parsed = urlparse(urlsearch)
        create_mode = parse_qs(parsed.query).get('mode', [''])[0]

        if create_mode == 'add':
            clientprofile_id = 0
            deletediv = 'd-none'
            
        else:
            clientprofile_id = int(parse_qs(parsed.query).get('id', [0])[0])
            deletediv =''
        
        return [clientprofile_id, deletediv]
    else:
        raise PreventUpdate
#Dynamic Header
@app.callback(
    Output('client_profile_header', 'children'),
    Input('url', 'search')
)
def update_header(urlsearch):
    parsed = urlparse(urlsearch)
    create_mode = parse_qs(parsed.query).get('mode', [''])[0]
    
    if create_mode == 'add':
        return "Add New Client"
    else:
        return "Edit Client Details"
#This inserts into database
@app.callback(
    [Output('submit_alert', 'color'),
     Output('submit_alert', 'children'),
     Output('submit_alert', 'is_open')],
    [Input('submit_button', 'n_clicks')],
    [State('first_name', 'value'),
     State('last_name', 'value'),
     State('company_name', 'value'),
     State('email_address', 'value'),
     State('date_acquired', 'value'),
     State('status', 'value'),
     State('url', 'search'),
     State('clientprofile_id', 'data')]
)
def submit_form(n_clicks, first_name, last_name, company_name, email_address, date_acquired, status, urlsearch, clientprofile_id):
    
    ctx = dash.callback_context
    if not ctx.triggered or not n_clicks:
        raise PreventUpdate

    parsed = urlparse(urlsearch)
    create_mode = parse_qs(parsed.query).get('mode', [''])[0]

    # Check for missing values in the required fields
    if not all([first_name, last_name, company_name, email_address, date_acquired, status]):
        return 'danger', 'Please fill in all required fields.', True

    # SQL to insert or update the database
    if create_mode == 'add':
        sql = """INSERT INTO client (client_first_name, client_last_name, client_company_name, client_email, date_acquired,
                client_status)
                VALUES (%s, %s, %s, %s, %s, %s);"""
        
        values = [first_name, last_name, company_name, email_address, date_acquired, status]
    
    elif create_mode == 'edit':
        sql = """UPDATE client
                SET client_first_name = %s,
                    client_last_name = %s,
                    client_company_name = %s,
                    client_email = %s,
                    date_acquired = %s,
                    client_status = %s
                WHERE client_id = %s;"""
        
        values = [first_name, last_name, company_name, email_address, date_acquired, status, clientprofile_id]
    else:
        raise PreventUpdate

    try:
        modifyDB(sql, values)
        return 'Success', 'Client Profile Submitted Successfully!', True
    except Exception as e:
        return 'danger', f'Error Occurred: {e}', True

#This prepopulates during edit mode
@app.callback(
    [Output('first_name', 'value'),
    Output('last_name', 'value'),
    Output('company_name', 'value'),
    Output('email_address', 'value'),
    Output('date_acquired', 'value'),
    Output('status', 'value'),
    ],
    [Input('clientprofile_id', 'modified_timestamp'),],

    [State('clientprofile_id', 'data'),]
)
def client_profile_populate(timestamp, clientprofile_id):
    if clientprofile_id > 0:
        sql = """SELECT client_first_name, client_last_name, client_company_name, client_email, date_acquired, client_status
                FROM client
                WHERE client_id = %s"""
        values = [clientprofile_id]
        col = ['first_name', 'last_name', 'company_name', 'email_address', 'date_acquired', 'status']

        df = getDataFromDB(sql, values, col)

        firstname = df['first_name'][0]
        lastname = df['last_name'][0]
        companyname = df['company_name'][0]
        emailaddress = df['email_address'][0]
        dateacquired = df['date_acquired'][0]
        status = df['status'][0]

        return [
            firstname, lastname, companyname, emailaddress, dateacquired, status]
    else:
        raise PreventUpdate
