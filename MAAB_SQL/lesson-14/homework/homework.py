import pyodbc
import pandas as pd
import yagmail

# === Step 1: Connect to SQL Server ===
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost;'
    'DATABASE=class14;'
    'UID=sa;'
    'PWD=Samadjon3106;'
)

# === Step 2: Query index metadata ===
query = """
SELECT 
    t.name AS TableName,
    ind.name AS IndexName,
    ind.type_desc AS IndexType,
    col.name AS ColumnName
FROM 
    sys.indexes ind 
INNER JOIN 
    sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id 
INNER JOIN 
    sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id 
INNER JOIN 
    sys.tables t ON ind.object_id = t.object_id 
WHERE 
    t.is_ms_shipped = 0
ORDER BY 
    t.name, ind.name;
"""

df = pd.read_sql(query, conn)

# === Step 3: Generate Styled HTML Report ===
html_table = df.to_html(index=False, border=1, justify='center')

html_report = f"""
<html>
<head>
    <style>
        body {{
            font-family: Arial, sans-serif;
        }}
        h2 {{
            text-align: center;
            color: #333;
        }}
        table {{
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
            font-size: 14px;
        }}
        th, td {{
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: center;
        }}
        th {{
            background-color: #f4f4f4;
            font-weight: bold;
        }}
        tr:nth-child(even) {{
            background-color: #fafafa;
        }}
    </style>
</head>
<body>
    <h2>📊 SQL Server Index Metadata Report</h2>
    {html_table}
</body>
</html>
"""

# === Step 4: Send the email ===
yag = yagmail.SMTP('samadjonsayfullayev3106@gmail.com', 'uhpooepfgjuprsvg')

yag.send(
    to='s.sayfullayev@newuu.uz',
    subject='SQL Server Index Metadata Report',
    contents=html_report
)

print("✅ Email sent successfully.")
