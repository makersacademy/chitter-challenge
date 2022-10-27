Chitter Challenge
=================

To create this app I have used:

* pg gem for the database connection.
* RSpec to write tests.
* Sinatra, the webrick gem and rack-test in order to set up and write the routes and to be able to run the app locally.
* BCrypt in order to encrypt the passwords so they are hashed and cannot be accessed through the db.
* Mail and Pony gems in order to set up the emails being sent.

Notes on running the app:

* If you tag someone in a peep they will recieve an email to the email address associated with their account from the email address associated with your account to let them know.

To run the app:

```
https://my-chitter-challenge.onrender.com/

```

To test the app:

```
$ git clone git@github.com:ellaskolnick/chitter-challenge.git
$ createdb chitter_challenge
$ psql -127.0.0.1 chitter_challenge < posts_table.sql
$ psql -127.0.0.1 chitter_challenge < spec/seeds/posts_seeds.sql
$ createdb chitter_challenge_test
$ psql -127.0.0.1 chitter_challenge_test < posts_table.sql
$ psql -127.0.0.1 chitter_challenge_test < spec/seeds/posts_seeds.sql
$ bundle install
$ rspec
```


Chitter Challenge - How it works:
==================================

Home page:

<img width="1084" alt="Screenshot 2022-10-27 at 18 59 11" src="https://user-images.githubusercontent.com/95581033/198364833-e3dee42a-bce1-40af-9836-734207d04887.png">


You can sign up:

<img width="1331" alt="Screenshot 2022-10-21 at 10 33 01" src="https://user-images.githubusercontent.com/95581033/197165815-170590fb-a287-454d-85f5-c98d48efc556.png">


You can login:

<img width="1334" alt="Screenshot 2022-10-21 at 10 33 10" src="https://user-images.githubusercontent.com/95581033/197165909-39144a2d-7a90-4be4-85f5-ad8d2e3971d7.png">

You can view the Peep Board without logging in:

<img width="1336" alt="Screenshot 2022-10-21 at 10 33 29" src="https://user-images.githubusercontent.com/95581033/197166003-ebf9a53a-7055-4df6-94e3-a53a58c422a2.png">

You can view all the replies to a peep without logging in:

<img width="1317" alt="Screenshot 2022-10-21 at 10 34 00" src="https://user-images.githubusercontent.com/95581033/197166079-1eb9a527-dd47-4074-ada8-d20511d3026e.png">

You can post a peep when you have logged in:

<img width="1321" alt="Screenshot 2022-10-21 at 10 34 34" src="https://user-images.githubusercontent.com/95581033/197166150-0ccfd987-43cf-4caf-8417-bd362d9085a0.png">

<img width="1330" alt="Screenshot 2022-10-21 at 10 34 41" src="https://user-images.githubusercontent.com/95581033/197166167-5d828496-0268-46ce-bef2-e7ceffb05a46.png">

You can reply to other people's peeps when you have logged in:

<img width="1337" alt="Screenshot 2022-10-21 at 10 34 53" src="https://user-images.githubusercontent.com/95581033/197166219-41865319-f60e-4a0f-8d58-00b054b570e2.png">

When you tag someone in a peep the tagged person will recieve an email letting them know:

<img width="307" alt="Screenshot 2022-10-27 at 17 32 24" src="https://user-images.githubusercontent.com/95581033/198347623-19b91a72-1453-487d-a631-7a82e512939f.png">

<img width="318" alt="Screenshot 2022-10-27 at 17 32 34" src="https://user-images.githubusercontent.com/95581033/198347632-5a80b6a2-874a-4729-993d-333df19098b4.png">

