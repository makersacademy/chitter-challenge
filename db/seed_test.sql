
insert into users (password_hash,username,display_name,email_address)
values
   ('$2a$12$oPama663FWDJQKbUtSbYx.GIocGsAganWNzzl/el7PD7cXrvMWYCO' ,'user1'        ,'Sally'  ,'sally@mcnally.com')
  ,('$2a$12$9pOC9BK2C7S6IiNUDwjio.LsFsXfZw5YA8iCxRAUNlIXJySg6LTS6' ,'AzureDiamond' ,'AD'     ,'azure@diamond.com')
  ,('$2a$12$whwxm.AEkFRIHdmWlY6trObUNsUEuukg8taBgLBTLTwntZ2IKmATm' ,'admin'        , 'admin' ,'admin@admin.com'  )
;

insert into peeps (user_id ,reply_to_peep_id ,content, created_at)
  values
     (1, null, 'Bring Sally up'  ,'2019-01-01 02:05:09')
    ,(1, null, 'Bring Sally down','2019-01-01 03:05:09')
    ,(1, null, 'Bring Sally up: a thread /2','2019-02-01 05:05:09')
    ,(2, null, 'hunter2','2019-02-23 12:05:09')
    ,(2, null, 'doesnt look like stars to me','2019-03-11 02:05:09')
    ,(2, null, 'you can go hunter2 my hunter2-ing hunter2','2019-03-12 02:05:09')
    ,(2, null, 'haha, does that look funny to you?','2019-03-14 02:05:09')
;

insert into peeps (user_id ,reply_to_peep_id ,content, created_at)
  values
    (3, 3, 'reply guy','2019-03-14 02:05:09')
    ;