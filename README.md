# Chitter

## *A clone of twitter*

## User Stories

```

```

## Domain Model

 ![Bookmark Manager domain model](./images/flow_diagram.png)


 ## Installing Database instructions:

 1. Connect to psql
```
$ psql postgres
```
 2. Create the database using the psql command
```
$ CREATE DATABASE chitter;
```
 3. Connect to the database using the follwing pqsl command
```
$ \c chitter;
```
 4. Run the '01_create_chitter_table.sql' file
```
$ psql -f 01_create_chitter_table.sql
```
 5.
