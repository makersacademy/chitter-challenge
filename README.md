Chitter Challenge
=================

## How to use

### **To set up the project**

* Clone this repository and then run:
```
  bundle
```

### **To set up the database**

1. Connect to `psql`
2. Create the database using the `psql` command 
```
  CREATE DATABASE chitter_manager;
```
3. Connect to the database using the `pqsl` command 
```
  \c chitter_manager;
```
4. Run the query saved in the file `01_create_peeps_table.sql`


### **To set up the test database**

1. Connect to `psql`
2. Create the database using the `psql` command 
```
  CREATE DATABASE chitter_manager_test;
```
3. Connect to the database using the `pqsl` command 
```
  \c chitter_manager_test;
```
4. Run the query saved in the file `01_create_peeps_table.sql`




## User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

Not yet:
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
