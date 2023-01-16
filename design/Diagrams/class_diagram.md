Databases

Peeps | Users | Scrabled passwords

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to `post a message (peep)` to chitter

As a maker
So that I can see what others are saying  
I want to see `all peeps in reverse chronological order`

As a Maker
So that I can better appreciate the context of a peep
I want to see the `time at which it was made`

As a Maker
So that I can post messages on Chitter as me
`I want to sign up for Chitter`

HARDER

As a Maker
So that only I can post messages on Chitter as me
`I want to log in to Chitter`

As a Maker
`So that I can avoid others posting messages on Chitter as me`
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am `tagged in a Peep`

```mermaid
classDiagram

    class Users{
      +int id
      +String full_name
      +String username
      +Int hashed_password_id
      +Int writer_peep_id
      +Int peep_reply_id
      +log_in()
      +log_out()
      +post_peep()
      +tag_peep()
      +reply_to_peep()
    }
    class HashedPasswords{
      +int id
      -int user_id
      -String hash
      -String salt 
      -create()
      -retrieve()
      -check()
    }
    class PeepReplies{
      +int id
      +Array content
      +int peep_id
      +run()
    }
        class Peeps{
      +int id
      +String content
      +int peep_id
      +int peep_reply_fk
      +int peep_tags_fk
      +date post_date
         +post_peep()

    }
        class PeepTags{
      +int id
      +run()
    }


```