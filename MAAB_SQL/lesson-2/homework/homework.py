import pyodbc

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost,1433;'
    'DATABASE=class2;'   # Replace with your actual database name
    'UID=sa;'
    'PWD=SamadSql2025!'
)

cursor = conn.cursor()

pdf_path = '/Users/samadjon/Downloads/ayam-2.pdf'

with open(pdf_path, 'rb') as file:
    pdf_data = file.read()

try:
    cursor.execute("DELETE FROM photos WHERE id = ?", (1,))
    cursor.execute("INSERT INTO photos (id, photo_format) VALUES (?, ?)", (1, pdf_data))
    conn.commit()
    print("PDF uploaded successfully into the database.")
except Exception as e:
    print("Error occurred:", e)
finally:
    cursor.close()
    conn.close()
