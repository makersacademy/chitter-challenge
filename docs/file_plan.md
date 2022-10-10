As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Nouns/verbs: Post a message (peep) to chitter, see peeps reverse chrono order, see time peep was made, sign up

Lib needed:
DatabaseConnection?
app.rb 
peep.rb
peep_respository.rb
signup.rb
signup_repository.rb

Databases/files:

- Database with table of all peeps that records what time peep was made and orders them reverse chronologically

- Second table of users - username and password

- Page that returns the inital database

- Login page - if user's username and password matches entry in the users database, send them to initial database

> `gem install rom-sql`

https://rom-rb.org/learn/changeset/5.2/

```
CREATE DATABASE chitter;
\c chitter
CREATE TABLE ... 
```

HTML files

Views
peeper.erb - initial database returned
login.erb - input user details, option to signup
signup.erb - input user details, returns to login
failed_login.erb - returns to login

Seeds files
users.sql - dyanmically updates with new users?
peeps.sql - dynamically updates with new peeps?
(new_user.sql?)
(new_peep.sql?)

spec
applicaiton_spec.rb
integration_spec.rb
signup_repository_spec.rb
peep_repository_spec.rb


PeepTable:
    - id
    - content
    - created_at

```sql
CREATE TABLE IF NOT EXISTS peeps (
    id bigserial PRIMARY KEY,
    content text NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);
```

```sql
INSERT INTO peeps (content) VALUES ('testing content');
```

UsersTable:
    - id
    - email
    - password

```sql
CREATE TABLE IF NOT EXISTS users (
    id bigserial PRIMARY KEY,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL
);
```

PeepClass:
    - GetPeeps()
        ```sql
            SELECT content, created_at
            FROM peeps
            ORDER BY created_at ASC;
        ```
    - CreatePeep(userID, content)
        ```sql
            INSERT INTO peeps
            VALUES (:userID, :content, time.Now());
        ```

UserClass:
    - Login(email, password)
        - LoggedIn -> ListPeeps
        - Failed erb

DisplayPeep - > Return Repository

