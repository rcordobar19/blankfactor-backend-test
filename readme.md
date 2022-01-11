# Rafael Córdoba - BlankFactor Backend test with Laravel.

Hi! I used Laravel Framework 8.78.1 and PHP 8.0.13 for this small API app.

The requirements were:
Create an API that given an User ID returns all the user info.
Create an API that takes User data from a POST request and save the info in the Database.

No frontend needed.

# Installation - Docker

To create the containers please browse to your code directory using the terminal and run `docker-compose up -d`

Please add the test domain in your hosts file.
For OS X just run: `sudo nano /etc/hosts` and then include it like:
```
127.0.0.1 blankfactor.test
```

# Installation - Laravel
Update the `.env` file with this, since we will be using docker mysql container:
```
DB_CONNECTION=mysql
DB_HOST=db-mysql
DB_PORT=3306
DB_DATABASE=blankfactor
DB_USERNAME=root
DB_PASSWORD=root
```

Then run migrations:
`php artisan db:migrate`

# Usage
You can use the seeder if you want to add some initial records to database
 `php artisan db:seed`

## API
Main endpoint: `blankfactor.test/api/`

**Show User**
Returns json data about a single user.

-   **URL**
`/users/:id`

-   **Method:**
    `GET`

-   **URL Params**
    **Required:** `id=[integer]`

-   **Data Params**
    None

-   **Success Response:**
    -   **Code:**  200
        **Content:**  `{ success: true, user: {id : 12, name: "Rafael".... }`

-   **Error Response:**
    -   **Code:**  200
        **Content:**  `{ success: false, message: "No query results...." }`


**Create User**
Add new user to the database.

-   **URL**
`/users/create`

-   **Method:**
    `POST`

-   **URL Params**
None

-   **Data Params**
    **Required:** `name=[string], last_name=[string], email=[unique,string], password=[string,min:8]`

-   **Success Response:**
    -   **Code:**  200
        **Content:**  `{ success: true, message:"User created", user: {id : 12, name: "Rafael".... }`

-   **Error Response:**
    -   **Code:**  200
        **Content:**  `{ success: false, message: "Validation errors...." }`



____________









# Old Readme

#Description

In this folder we are providing a database for the test, a simple MySQL DB running through Docker.

# Instalation

- You need to install docker locally so follow the instruction on docker's webpage https://docs.docker.com/desktop/#download-and-install 

- Also you will need to be able to run docker-compose https://docs.docker.com/compose/install/

- To run the instalation of docker you will need to run the command 
```
docker-compose up
```
with that you will have the database running on the 3307 port

# Considerations

The database has only one database called `blankfactor` with a table called `users`. The table has the following structure
```
+-----------+-----------------+------+-----+---------+----------------+
| Field     | Type            | Null | Key | Default | Extra          |
+-----------+-----------------+------+-----+---------+----------------+
| id        | bigint unsigned | NO   | PRI | NULL    | auto_increment |
| name      | varchar(100)    | NO   |     | NULL    |                |
| last_name | varchar(100)    | YES  |     | NULL    |                |
| email     | varchar(250)    | NO   | UNI | NULL    |                |
| password  | varchar(250)    | NO   |     | NULL    |                |
+-----------+-----------------+------+-----+---------+----------------+
```

The users are:

- Normal user: bfuser:bfpassword
- Root user: root:root

You can make any change to the db if you need it by managing it directly, you can connect via the next commands

```
docker exec -it db-mysql bash 
mysql -u bfuser -p
```
Then entering the password bfpassword

Or you can use a DB manager like MySQL Workbench


That's all, if you have any question you can ask them to `santiago.agudelo@blankfactor.com`.
Have fun!
