## CHITTER WEB APP CHALLENGE.

### Fist step.

In this challenge i will try to build an message app, called Chitter.

In this first stage of the project. I am gonna follow the following steps:

- Setup the project.
- Create a first welcoming message to the app.
- Test the code in a feature test in the most basic way.

The first commit include until here.

------------------------------------------------------------------------------
### Second step.

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

To implement that requirement i have followed this steps to comply in the most
simple way.

- In app.rb i have created the following get and post requests:

```

  get '/' do
    # now the message is delivered in the erb file. index.erb
    # "This is Chitter, your instant message service!"
    erb :index
  end

  post '/peeps/new' do
    redirect '/peeps'
  end

  get '/peeps' do
    "New peep posted"
  end

  ```

  Within the MVC model those request are referenced to the erb file index.erb, which, in this step, has this content:

  ```
  <h2>This is Chitter, your instant message service!</h2>

<form action="/peeps/new" method="post">
  <input type="text" name=peep placeholder="Post your peep" required>
  <input type="submit" value="New peep">
```  

At this point, all the test are passing and the web app is able to send a peep and received a message in the index page wich inform the user that the message has been posted.

 - At this point i am making my second commit.
-------------------------------------------------------------------------------

## THIRD STEP.

In this step i am starting to refactor the MVC, i want at this point that the user can insert as many peeps as he wants. At this poing i am gonna create a hard code just for the 3 initial messages, which will be displayed in the screen.
To do that i created a separated class with a method which return an array of 3 messages.
The array have been tested, and of course at this stage the test are failing because, just to show the difference in the code in smaller steps i am not going to implement the views code.

So at this point:

- Class Peep has been created. in peep.rb
- Test for the method #posted_peeps has been implemented.
- Feature test for peeps.erb showing the very fist message has been implemented.

At this point i am making my third commit.

-------------------------------------------------------------------------------
