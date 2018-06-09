
To recreate this project, you will need a local postgres database installation and the following databases:

``` 
psql

CREATE DATABASE chitter_challenge;
\c chitter_challenge
CREATE TABLE chitter ( id serial PRIMARY KEY, Peeps VARCHAR(128), TimeStamp TIME);


CREATE DATABASE chitter_challenge_test;
\c chitter_challenge_test
CREATE TABLE chitter ( id serial PRIMARY KEY, Peeps VARCHAR(128), TimeStamp TIME);
```

```SELECT * FROM chitter;```

 id | peeps | timestamp
----+-------+-----------