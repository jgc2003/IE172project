import dash
import dash_bootstrap_components as dbc
from dash import dcc, html, Input, Output
import pandas as pd
from dbconnect import getDataFromDB
from app import app

layout = dbc.Container([
    # Title Row for Client Profile Management
    dbc.Row(
        [
            dbc.Col(
                [
                    html.H2(
                        'CLIENT DIRECTORY', 
                        style={"marginBottom": "0px"}  # Reduce space below heading
                    ),
                ],
                md=8,
            ),
            dbc.Col(
                dbc.Button(
                    "Add New Client",
                    href='/client_profile/client_management_profile?mode=add',
                    style={"borderRadius": "20px", "fontWeight": "bold", "fontSize": "18px", "backgroundColor": "#194D62", "color": "white", "marginBottom": "0px"},
                    className="float-end"
                ),
                md=4,
                style={"display": "flex", "alignItems": "center", "justifyContent": "flex-end"},
            ),
        ],
        className="mb-1", # Adjust margin-bottom of row
        align="center"
    ),
    html.Hr(),

    # Row for search bar and Add New Client button
    dbc.Row(
        [
            dbc.Col(
                [
                    html.Label(
                        "Search client ID or Name", 
                        className="form-label", 
                        style={"fontSize": "18px", "fontWeight": "bold"}
                    ),
                    dcc.Input(
                        id="search_client_name",  # ID for search bar
                        type="text",
                        placeholder="Enter Client ID or name...",
                        className="form-control",
                        style={"borderRadius": "20px", "backgroundColor": "#f0f2f5", "fontSize": "18px"}
                    ),
                ],
                md=8,
            ),
        ],
        className="mb-4",
        align="center"
    ),

    # Row for the table placeholder
    dbc.Row(
        dbc.Col(
            html.Div(
                id="client-table",  # ID for table placeholder
                className="text-center",
                style={"fontSize": "18px", "color": "#666", "padding": "50px", "height": "1000px"}  # Adjust height here
            ),
            width=12,
            style={"border": "2px solid #194D62", "borderRadius": "10px", "padding": "20px"}
        ),
    ),
], fluid=True, style={"padding": "20px", "backgroundColor": "#f8f9fa"})

@app.callback(
    Output('client-table', 'children'),
    [
        Input('search_client_name', 'value'),
    ]
)

def update_records_table(clientfilter):
    # Base SQL query for the Client table
    sql = """
        SELECT 
            c.client_id,
            CONCAT(c.client_first_name, ' ', c.client_last_name) AS "Client Name",
            c.client_company_name AS "Company",
            c.client_email AS "Email Address",
            c.date_acquired AS "Date Acquired",
            c.client_status AS "Status"
        FROM
            client c

    """
    val = []

    # Add the WHERE clause if a filter is provided
    if clientfilter:
        # Check if the filter is numeric to search by client_id
        if clientfilter.isdigit():
            sql += " WHERE c.client_id = %s"
            val.append(int(clientfilter))
        else:
            sql += """
                WHERE 
                c.client_first_name ILIKE %s OR 
                c.client_last_name ILIKE %s
            """
            val.extend([f'%{clientfilter}%'] * 3)

    # Add the GROUP BY and ORDER BY clauses
    sql += """
        GROUP BY 
        c.client_id, c.client_first_name, c.client_last_name, c.client_company_name, c.client_email, c.date_acquired, c.client_status
        ORDER BY 
        c.client_id
    """

    # Define the column names
    col = ["Client ID", "Client Name", "Company Name", "Email Address", "Date Acquired", "Status"]

    # Fetch the filtered data into a DataFrame
    df = getDataFromDB(sql, val, col)

    if df.empty:
        return [html.Div("No records found.", className="text-center")]

    # Generating edit buttons for each Client
    df['Action'] = [
        html.Div(
            dbc.Button("Edit", color='warning', size='sm', 
                       href=f'/client_profile/client_management_profile?mode=edit&id={row["Client ID"]}'),
            className='text-center'
        ) for idx, row in df.iterrows()
    ]
    display_columns = ["Client ID", "Client Name", "Company Name", "Email Address", "Date Acquired", "Status","Action"]
    # Creating the updated table with centered text
    table = dbc.Table.from_dataframe(df[display_columns], striped=True, bordered=True, hover=True, size='sm', style={'textAlign': 'center'})

    return [table]

print(update_records_table)
