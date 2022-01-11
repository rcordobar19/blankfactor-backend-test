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
