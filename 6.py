# change passwd if error in connectivity: ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
import mysql.connector

db = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = 'root',
    database = 'pr6'
)

cursor = db.cursor();
# cursor.execute("CREATE DATABASE pr6;")

# cursor.execute('SHOW DATABASES;')

create_table_query = """
CREATE TABLE IF NOT EXISTS my_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
)
"""
cursor.execute(create_table_query)


# Insert values into the table manually
insert_query = """
INSERT INTO my_table (name) VALUES
('John'),
('Alice'),
('Bob')
"""
cursor.execute(insert_query)

# Commit the changes to the database
db.commit()


# Update a record manually
update_query = "UPDATE my_table SET name = 'Jane' WHERE id = 1"
cursor.execute(update_query)
db.commit()

# Delete a record manually
delete_query = "DELETE FROM my_table WHERE id = 1"
cursor.execute(delete_query)
db.commit()

cursor.execute("SELECT * FROM my_table")
for x in cursor:
    print(x)
