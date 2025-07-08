import pyodbc

# Connection details
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost,1433;'
    'DATABASE=class2;'  # Replace with your actual DB name
    'UID=sa;'
    'PWD=SamadSql2025!'
)

cursor = conn.cursor()

# Select the PDF data from the table
cursor.execute("SELECT photo_format FROM photos WHERE id = ?", (1,))
row = cursor.fetchone()

if row and row[0]:
    with open("retrieved_file.pdf", "wb") as file:
        file.write(row[0])
    print("File retrieved and saved successfully as 'retrieved_file.pdf'")
else:
    print("No file found with ID = 1")

cursor.close()
conn.close()
