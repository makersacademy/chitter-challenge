CRC

Chitter | collaborators
post(peep, time = Time.now) | User (must know which user is posting)
all

User | collaborators
create(name, username)
sign_in(username)

Database: Chitter

Table: peeps

id | message | time | user_username

Table: Users

id | name | username | email | password

Web pages

Log in to post a tweet:
[username]
submit
link: sign up

Sign up:
[name] [username]
submit
link: log-in

Post tweet:
[tweet] submit
link: see all tweets

Homepage: button see all Tweets
link: post a tweet
All tweets:
list of all tweets with time created
shows name and username
