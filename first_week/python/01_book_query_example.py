"""Week 1 Python practice: run a simple SQL query from Python."""


def print_books_above_20(book_database_connection):
    """Query books above 20.00 and print title/category results."""
    query = (
        "SELECT Title, Category "
        "FROM Book "
        "WHERE Price > 20.00"
    )

    cursor = book_database_connection.cursor()
    cursor.execute(query)

    for row in cursor.fetchall():
        print("Title:", row[0])
        print("Category:", row[1])


if __name__ == "__main__":
    print("Provide a valid database connection and call print_books_above_20(connection).")
