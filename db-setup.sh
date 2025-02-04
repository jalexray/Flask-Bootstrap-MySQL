#!/bin/bash

# This script is used to create a new MySQL database and user.
# It will prompt the user for the MySQL root username and password,
# and then create a new user with all privileges to the database.

# To give permission to execute the script, run the command:
# chmod +x db-setup.sh

# To run the script, run the command:
# ./db-setup.sh

# Function to prompt user for input
get_user_input() {
    read -p "Enter MySQL root username: " MYSQL_ROOT_USER
    echo "" # New line for better formatting

    read -p "Enter new database name: " DB_NAME
    echo "" # New line for better formatting

     read -p "Enter new database user: " USER_NAME
    echo "" # New line for better formatting

    read -s -p "Enter new MySQL user password (optional): " DB_PASS
    echo "" # New line for better formatting
}

# Function to create the database and user
create_mysql_db() {
    SQL_COMMANDS="
    CREATE DATABASE IF NOT EXISTS $DB_NAME;
    CREATE USER IF NOT EXISTS '$USER_NAME'@'localhost' IDENTIFIED BY '$DB_PASS';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'localhost';
    FLUSH PRIVILEGES;
    "

    echo "🚀 Executing MySQL commands..."
    mysql -u$MYSQL_ROOT_USER -e "$SQL_COMMANDS"

    if [ $? -eq 0 ]; then
        echo "✅ Database and user created successfully!"
    else
        echo "❌ Failed to execute MySQL commands. Please check your credentials and try again."
    fi
}

setup_flask_db() {
    echo "🔧 Running Flask database setup..."
    
    export FLASK_APP=app.py  # Adjust this if your Flask app file is different

    flask db init
    flask db migrate -m "Initial migration"
    flask db upgrade

    if [ $? -eq 0 ]; then
        echo "✅ Flask database initialized and migrated successfully!"
    else
        echo "❌ Failed to set up Flask database."
        exit 1
    fi
}

update_env_file() {
	ENV_FILE=".env"

	# Check if .env file exists, if not, create it
	if [ ! -f "$ENV_FILE" ]; then
		touch "$ENV_FILE"
	fi

	echo "DATABASE_NAME=\"$DB_NAME\"" >> "$ENV_FILE"
	echo "DATABASE_USER=\"$USER_NAME\"" >> "$ENV_FILE"
	echo "DATABASE_PASSWORD=\"$DB_PASS\"" >> "$ENV_FILE"

	echo "✅ .env file updated successfully!"
}

# Main script execution
echo "🔍 Checking MySQL status..."
get_user_input
create_mysql_db
update_env_file()
