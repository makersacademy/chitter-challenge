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
