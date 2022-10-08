DROP TABLE IF EXISTS current_maker; 

CREATE TABLE current_maker(
    id SERIAL PRIMARY KEY,
    status text,
     
    maker_id int,
    constraint fk_maker foreign key(maker_id) 
    references makers(id) 
    on delete cascade
);

TRUNCATE TABLE current_maker RESTART IDENTITY;
