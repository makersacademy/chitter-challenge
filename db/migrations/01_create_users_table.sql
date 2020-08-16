CREATE TABLE users (id SERIAL PRIMARY KEY, 
                    username VARCHAR(60), 
                    email VARCHAR(60), 
                    password VARCHAR(60), 
                    full_name VARCHAR(60));