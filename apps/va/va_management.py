import dash
import dash_bootstrap_components as dbc
from dash import dcc, html, Input, Output
import pandas as pd
from dbconnect import getDataFromDB
from app import app

layout = dbc.Container([
    # Title Row for VA Profile Management
    dbc.Row(
        [
            dbc.Col(
                [
                    html.H2(
                        'VA DIRECTORY', 
                        style={"marginBottom": "0px"}  # Reduce space below heading
                    ),
                ],
                md=8,
            ),
            dbc.Col(
                dbc.Button(
                    "Add New VA",
                    href='/va_profile/va_management_profile?mode=add',
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

    # Row for search bar and Add New va button
    dbc.Row(
        [
            dbc.Col(
                [
                    html.Label(
                        "Search VA ID or Name", 
                        className="form-label", 
                        style={"fontSize": "18px", "fontWeight": "bold"}
                    ),
                    dcc.Input(
                        id="search_va_name",  # ID for search bar
                        type="text",
                        placeholder="Enter VA ID or name...",
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

    dbc.Row(
        [
            dbc.Col(
                dbc.Button(
                    "VA Info",
                    href='/va_profile',
                    style={"borderRadius": "10px", "fontWeight": "bold", "fontSize": "16px", "backgroundColor": "#194D62", "color": "white", "marginBottom": "0px", "marginLeft": "0px"}
                ), width='auto'
            ),
            dbc.Col(
                dbc.Button(
                    "Skills",
                    href='/va_skills',
                    style={"borderRadius": "10px", "fontWeight": "bold", "fontSize": "16px", "backgroundColor": "#194D62", "color": "white", "marginBottom": "0px", "marginRight": "0px"}
                ), width='auto'
            ),
        ], className="g-1"
    ),

    # Row for the table placeholder
    dbc.Row(
        dbc.Col(
            html.Div(
                id="va-table",  # ID for table placeholder
                className="text-center",
                style={"fontSize": "18px", "color": "#666", "padding": "0px", "height": "1000px"}  # Adjust height here
            ),
            width=12,
            style={"border": "2px solid #194D62", "borderRadius": "10px", "padding": "20px", "marginTop": "10px"}
        ),
    ),
], fluid=True, style={"padding": "20px", "backgroundColor": "#f8f9fa"})

@app.callback(
    Output('va-table', 'children'),
    [
        Input('search_va_name', 'value'),
    ]
)

def update_records_table(vafilter):
    # Base SQL query for the va table
    sql = """
        SELECT 
            v.va_id,
            CONCAT(v.va_first_m, ' ', v.va_last_m) AS "VA Name",
            v.va_email AS "Email Address",
            v.va_address AS "Address",
            v.date_hired AS "Date Hired",
            v.va_status AS "Status"
        FROM
            va v

    """
    val = []

    # Add the WHERE clause if a filter is provided
    if vafilter:
        # Check if the filter is numeric to search by va_id
        if vafilter.isdigit():
            sql += " WHERE v.va_id = %s"
            val.append(int(vafilter))
        else:
            sql += """
                WHERE 
                v.va_first_m ILIKE %s OR 
                v.va_last_m ILIKE %s
            """
            val.extend([f'%{vafilter}%'] * 2)

    # Add the GROUP BY and ORDER BY clauses
    sql += """
        GROUP BY 
        v.va_id, v.va_first_m, v.va_last_m, v.va_email, v.va_address, v.date_hired, v.va_status
        ORDER BY 
        v.va_id
    """

    # Define the column names
    col = ["VA ID", "VA Name", "Email Address", "Address", "Date Hired", "Status"]

    # Fetch the filtered data into a DataFrame
    df = getDataFromDB(sql, val, col)

    if df.empty:
        return [html.Div("No records found.", className="text-center")]

    # Generating edit buttons for each va
    df['Action'] = [
        html.Div(
            dbc.Button("Edit", color='warning', size='sm', 
                       href=f'/va_profile/va_management_profile?mode=edit&id={row["VA ID"]}'),
            className='text-center'
        ) for idx, row in df.iterrows()
    ]
    display_columns = ["VA ID", "VA Name", "Email Address", "Address", "Date Hired", "Status","Action"]
    # Creating the updated table with centered text
    table = dbc.Table.from_dataframe(df[display_columns], striped=True, bordered=True, hover=True, size='sm', style={'textAlign': 'center'})

    return [table]
