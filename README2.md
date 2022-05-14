As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

/
- homepage

/messages
- where posts are

/messages/add
- adds new message

Chitter <--post--> message

Message.post(text)
Message.new

Message.all

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

Message.new.time



## Database setup


1. Connect to psql

2. Create the 'messages' and 'messages_test' databases:

```
CREATE DATABASE messages;
CREATE DATABASE messages_test;
```

3. To set up appropriate tables, connect to each database in 'psql' and run the SQL scripts in the 'db/migrations' folder in the given order.