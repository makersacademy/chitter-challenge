#Week 4: Chitter Challenge

##Installation Instructions

Run the following in the command line:

```
git clone git@github.com:Andrew47/chitter-challenge.git
bundle
createdb chitter_development
rake auto_migrate
rspec
rackup
```

Then use following URL: [http://localhost:9292/](http://localhost:9292/)

##Guide to using the program

###Home-page

To see posted messages, click 'Display Messages'. Otherwise, 'Sign Up' if you are
a new user, or 'Log In' if you are a returning user.

![Home-page](https://home_page.png)

###Messages Page

Messages are displayed in reverse chronological order. The time of posting is in
blue. To post a new message, click 'New Message'.

![Messages](https://messages.png)

###New Message Post Page

Type the text in the box, and then click post. Then your message should be
displayed.

![New Message Post](https://new_message_post.png)
