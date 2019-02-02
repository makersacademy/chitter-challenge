CREATE TABLE users (
   id SERIAL primary key,
   name varchar(255),
   email varchar(255),
   username varchar(255),
   password varchar(255),
   created_at timestamp,
   updated_at timestamp
   );