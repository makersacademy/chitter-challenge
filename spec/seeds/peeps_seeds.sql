DROP TABLE IF EXISTS peeps; 

CREATE TABLE peeps(
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP,
    content text,
     
    maker_id int,
    constraint fk_maker foreign key(maker_id) 
    references makers(id) 
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("timestamp", "content", "maker_id") VALUES
((select date_trunc('second', now())), 'Today was a day.', 1),
((select date_trunc('second', now())), 'Woof.', 2);