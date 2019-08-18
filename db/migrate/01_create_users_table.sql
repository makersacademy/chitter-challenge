create table
  users
    (id serial primary key
    ,password_hash varchar(255)
    ,username varchar(255)
    ,display_name varchar(255)
    )
