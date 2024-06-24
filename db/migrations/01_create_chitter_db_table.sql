Database setup: chitter  
                CREATE TABLE chitter_db
                (id SERIAL PRIMARY KEY,
                peep varchar
                time time
                date date
                user varchar);
                CREATE TABLE chitter_account
                (id SERIAL PRIMARY KEY,
                email varchar
                password varchar);