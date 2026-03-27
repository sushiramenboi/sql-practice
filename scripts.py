# first basic script that I wrote to understand how can i connect a python script to a database.

bookCursor = bookDatabaseConnection.cursor()
bookQuery = (
    'SELECT Title, Category '
    'FROM Book '
    'WHERE Price > 20.00')

bookCursor.execute(bookQuery)
for resultRow in bookCursor.fetchall():
    print('title', resultRow[0])
    print('Category', resultRow[1])
