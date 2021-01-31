create table chitterer
  (
    id serial primary key
    ,name varchar(144) not null
    ,username varchar(60) not null
    ,email_address varchar(255) not null
    ,password varchar(60) not null
  )
