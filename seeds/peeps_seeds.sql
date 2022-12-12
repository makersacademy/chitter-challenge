DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    peep_date timestamp with time zone,
    tags text,
    user_id int,
    constraint fk_order foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "peep_date", "tags", "user_id") VALUES
('I wanna know what love is', '2022-07-31 23:59:59', '#iwantyoutoshowme #pizza', 1),
('Apparently bleach can extend the life of your flowers', '2022-08-31 07:14:29', '#flowers #gardening', 2),
('Be aware that cheeze contains nuts', '2021-10-04 12:04:22', '#ohdear', 2),
('Old time is still a-flyin', '2022-09-07 19:07:07', '#robertherrick #makemuchoftime', 1);
