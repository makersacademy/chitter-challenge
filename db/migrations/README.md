```Getting started:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `pqsl` command `\c chitter;`
4. Run the query we have saved in the file `01_create_chitter_table.sql`

Setting up test databases:

1. Connect to `psql`
2. Create the test database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `pqsl` command `\c chitter_test;`
4. Run the query we have saved in the file `01_create_chitter_table.sql
```

To post a peep
- install bundle
- ensure the above mentioned databases and tables above are created on your local machine
- run rackup
- go to the address /peeps/new
- post a peep (functionality for user sign up not complete)
