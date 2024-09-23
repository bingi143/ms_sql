'''

@Author: Venkatesh
@Date: 2024-09-19 18:00:30
@Last Modified by: Venkatesh
@Last Modified time: 2024-09-19 18:00:30
@Title : Program Aim to to do crud operations using pyodbc


''' 


import pyodbc
import pandas as pd;


def connection_method():
    '''
          Description: 
                This function is creating the connection
          Parameters: 
                None
          Return : 
                Returns the curson to execute and pyodbc connection variable
    '''
    connection_string =(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=LAPTOP-8LU844KJ\SQLEXPRESS;'  
    'DATABASE=Employee;'    
    'Trusted_Connection=yes;')

    connection=pyodbc.connect(connection_string)
    cursor=connection.cursor()

    return cursor,connection


def create_table(cursor,connection):
    '''
          Description: 
                This function is to create table
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connection variable
          Return : 
                Returns the curson to execute 
    '''
    #--------creating table
    #creating tabble parent table
    table_name=input("Enter table name:")
    column_details=input("Enter column formate:column_name data type constraint,....")
    table_1=f"create table {table_name} ({column_details})"

    cursor.execute(table_1)
    connection.commit()
    print(f" {table_name} table created successfully")



def inserting_data_into_product(cursor,connection):
    '''
          Description: 
                This function is inserting data into product table
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connection variable
          Return : 
                None
    '''

    table_name=input("Enter table name:")
    columns=input("Enter columns(separated by comma):")
    values=input("Enter values (separated by comma):")
 
    insert_query=f"insert into {table_name} ({columns}) values({values})"
    cursor.execute(insert_query)
    connection.commit()

    print(f"Data inserted into {table_name}successfuly")


#----reading data-----

def displaying_table(cursor):
    '''
          Description: 
                This function is displaying entire table data
          Parameters: 
                cursor: to execute the mssql queries
          Return : 
                None
    '''
    #--displaying entire employee table
    table_name=input("Enter table name:")
    query_1=f"select * from {table_name}"

    cursor.execute(query_1)

    rows=cursor.fetchall()
    for row in rows:
        print(row)


def update_table_column_name(cursor,connection):
    '''
          Description: 
                This function is updating table column name
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connected variable
          Return : 
                None
    '''
    table_name = input("Enter table name: ")
    old_column = input("Enter column to update: ")
    new_column = input(f"Enter new value for: ")

    update_column_query=f"EXEC Sp_rename '{table_name}.{old_column}','{new_column}','COLUMN'"

    cursor.execute(update_column_query)
    connection.commit()
    print("column updated successfully")


def update_value_in_table(cursor,connection):
    '''
          Description: 
                This function is updating the value 
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connected variable
          Return : 
                None
    '''
    table_name = input("Enter table name: ")
    set_column = input("Enter column to update: ")
    new_value = input(f"Enter new value for {set_column}: ")
    condition = input("Enter condition for update (e.g., 'ID = 1'): ")

    update_value_query=f"update {table_name} set {new_value} where {condition}'"
    cursor.execute(update_value_query)
    connection.commit()
    print("value updated successfully ")

def delete_row_in_table(cursor,connection):
    '''
          Description: 
                This function is delete row in database table 
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connected variable
          Return : 
                None
    '''
    table_name=input("Enter table name:")
    condition = input("Enter condition for delete row (e.g., 'ID = 1'): ")

    delete_row_query=f"delete from {table_name} where {condition}"
    cursor.execute(delete_row_query)
    connection.commit()
    print("Deleted row succussfully")

def delete_colum_in_table(cursor,connection):
    '''
          Description: 
                This function is delete column in database table 
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connected variable
          Return : 
                None
    '''
    table_name=input("Enter table name:")
    column=input("Enter column name to delete:")
    delete_column_query=f"alter table {table_name} drop column {column}"
    cursor.execution(delete_column_query)
    connection.commit()
    print(f"{column} deleted successfully")


def delete_table(cursor,connection):
    '''
          Description: 
                This function is delete the product table
          Parameters: 
                cursor: to execute the mssql queries
                connection: pyodbc connected variable
          Return : 
                None
    '''
    table_name=input("Enter table name:")
    query_delete=f"drop table {table_name}"
    cursor.execute(query_delete)
    connection.commit()
    print(f"Deleted {table_name} table ")



def main():
   cursor,connection=connection_method()

   while True:
        print("\nCRUD Operations Menu:")
        print("1. Create Table")
        print("2. Insert Data")
        print("3. Display Table")
        print("4. Update column name")
        print("5. Update data in table ")
        print("6. Delete row in table")
        print("7. Delete column in table")
        print("8. Delete table in data base")
        print("9. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            create_table(cursor, connection)
        elif choice == '2':
            inserting_data_into_product(cursor, connection)
        elif choice == '3':
            displaying_table(cursor)
        elif choice == '4':
            update_table_column_name(cursor, connection)
        elif choice=='5':
            update_value_in_table(cursor,connection)
        elif choice == '6':
            delete_row_in_table(cursor, connection)
        elif choice =='7':
            delete_colum_in_table(cursor,connection)
        elif choice =='8':
            delete_table(cursor,connection)
        elif choice == '9':
            break
        else:
            print("Invalid choice. Please try again.")


if __name__=="__main__":
    main()
