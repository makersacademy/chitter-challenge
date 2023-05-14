require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  include Rack::Test::Methods
  let(:app) { Application.new }

  context '/' do
    it 'Should return a html formatted web page including a welcome banner' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Welcome to the Chitter-Sphere!</h1>')
    end

    it 'Should include a photograph/graphic' do
      response = get('/')
      expect(response.body).to include ('<img src="/logo.jpg"></img>')
    end

    it 'Should include 5 different hyperlinks' do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/peeps"><button>View all peeps</button></a>')
      expect(response.body).to include ('<a href="/peep/new"><button>Post a new peep</button></a>')
      expect(response.body).to include ('<a href="/loginpage"><button>Log in</button></a>')
      expect(response.body).to include ('<a href="/signup"><button>Sign up</button></a>')
      expect(response.body).to include('<a href="/userpage"><button>My account</button></a>')
    end
  end

  context '/peeps' do
    it 'Should display all peeps from all makers within the peeps database formatted in HTML' do
      response = get('/peeps')
      expect(response.status).to eq (200)
      expect(response.body).to include ('HayleyOk')
      expect(response.body).to include ('Another test peep')
      expect(response.body).to include ('2023-07-21 12:25:12')
    end
  end

  context '/loginpage' do
    it 'Should return a login submit form' do
      response = get('/loginpage')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<form method="POST" action="/loginpage">')
      expect(response.body).to include ('<input type="text" name="username" autocomplete="off"/>')
      expect(response.body).to include ('<input type="password" name="password"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    it 'Should return an error page when username is not present within the DB' do
      response = post('/loginpage', username: 'FakeUsername', password: 'Password1!')
      expect(response.status).to eq(500) # add an alternate fail test here. 
    end

    it 'Should return an alternate/error page when password is incorrect' do
      response = post('/signup', name: 'Tom Segura', username: 'TommyBuns', email_address: 'YMH@mail.com', password: 'YMH')
      response = post('/loginpage', username: 'TommyBuns', password: 'cabbage')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Login unsuccessful')
      expect(response.body).to include ('<p>Please return to the login page and try again</p>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/signup', name: 'Harry Potter', username: 'BigPott', email_address: 'phillosopher@mail.com', password: 'SickScar')
      response = post('/loginpage', username: 'BigPott', password: 'SickScar')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Harry Potter')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/signup', name: 'Kirk Hammett', username: 'KingKirk', email_address: 'shredding@mail.com', password: 'shreddster')
      response = post('/loginpage', username: 'KingKirk', password: 'shreddster')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Kirk Hammett')
    end

    it 'Should return a list of user options as hyperlinks' do
      response = post('/signup', name: 'Some King of User', username: 'SomeKindOfUser', email_address: 'metallica@mail.com', password: 'hetfield')
      response = post('/loginpage', username: 'SomeKindOfUser', password: 'hetfield')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/delete_peep">Delete a peep</a>')
      expect(response.body).to include ('<a href="/peeps/:id">View your previous peeps</a>')
      expect(response.body).to include ('<a href="/logout">Log out</a>')
    end
  end

  context '/signup' do
    it 'Should return a sign up form to add a new maker to the database' do
      response = get('/signup')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<form method="POST" action="/signup">')
      expect(response.body).to include ('<h1>Create an account</h1>')
      expect(response.body).to include ('<input type="text" name="name" autocomplete="off"/>')
      expect(response.body).to include ('<label>Username:</label>')
      expect(response.body).to include ('<input type="text" name="username" autocomplete="off"/>')
      expect(response.body).to include  ('<input type="password" name="password"/>')
    end
  
    it 'Should add a new maker to the database/create a maker account and then redirect to user page' do
      response = post('/signup', name: 'Matt', username: 'mattmatttest', email_address: 'bigmatt44@gmail.com', password: 'ValidPassword12')
      expect(response.status).to eq (302)
    end

    it 'Should return an error when username already exists in database' do
      response = post('/signup', name: 'Hayley A', username: 'HayleyOk', email_address: 'hayleyhayley@tiscali.net', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when the email address already exists in the database' do
      response = post('/signup', name: 'Hayley A', username: 'HayleyAlt', email_address: 'another_fake_email420@gmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when a nil value is entered' do
      response = post('/signup', name: '', username: 'MattAlt', email_address: 'mattaltfakeemail@gmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when an input is empty' do
      response = post('/signup', name: 'Matt H', username: '     ', email_address: 'fakestofthemall@testmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end
  end

  context 'peep/new' do
    it 'Should return an error page with hyperlinks to log in if user is not logged in already' do
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<p>To post a new peep please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return a form page to create a new peep if the user is logged in' do
      response = post('/signup', name: 'Lars Ulrich', username: 'Lars', email_address: 'napster@mail.com', password: 'lars')
      response = post('/loginpage', username: 'Lars', password: 'lars')
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Post a new peep to Chitter</h1>')
      expect(response.body).to include ('<form method="POST" action="/peep/new">')
      expect(response.body).to include ('<input type="text" name="content" autocomplete="off"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    #  Check these tests:
    it 'Should only allow users logged into their account to successfully create new peeps' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = post('/peep/new', title: 'new title', content: 'This is some content yes')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Your Peep was successfully posted!</h1>')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
      expect(response.body).to include ('<a href="/">Homepage</a>')
    end

    it 'Should return an error if the title of the peep already exists in database' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = post('/peep/new', title: 'A second peep', content: 'This is some fake content')
      expect(response.status).to eq (400)
    end
  end
  
    # Check these tests:
  context '/peeps/:id' do
    it 'Should return all peeps by passed maker in a formatted HTML list only if user is logged in' do
      response = post('/signup', name: 'Severus Snape', username: 'SnapeSnape', email_address: 'halfblood@mail.com', password: 'halfit')
      response = post('/loginpage', username: 'SnapeSnape', password: 'halfit')
      response = post('/peep/new', title: 'This is a test peep', content: 'A test peep')
      response = get('/peeps/1')
      expect(response.status).to eq (200)
      expect(response.body).to include ('Severus Snapes Peeps')
      expect(response.body).to include ('This is a test peep')
    end

    it 'Should return all peeps by passed maker in a formatted HTML list only if user is logged in' do
      response = post('/signup', name: 'Fake User', username: 'faketest', email_address: 'faketestemail@gmail.com', password: 'fakepassword')
      response = post('/loginpage', username: 'faketest', password: 'fakepassword')
      response = post('/peep/new', title: 'A new pretend peep', content: 'This is some content')
      response = get('/peeps/1')
      expect(response.status).to eq (200)
      expect(response.body).to include ('Fake Users Peeps')
      expect(response.body).to include ('A new pretend peep')
      expect(response.body).to include ('This is some content')
    end

    it 'Should return the log in page if user is not logged in/no active session' do
      response = get('/peeps/1')
      expect(response.body).to include ('<h1>Login required</h1>')
      expect(response.body).to include ('<p>To view all of your existing peeps please login or create an account to start peeping</p>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end
  end

  context '/logout' do
    it 'Should redirect user to the homepage' do
      response = post('/signup', name: 'Logout user', username: 'logout', email_address: 'logout@gmail.com', password: 'validpassword')
      response = post('/loginpage', username: 'logout', password: 'validpassword')
      response = get('/logout')
      expect(response.status).to eq (302)
    end

    it 'Should return the homepage with the session set to nil - This will prevent user from posting a peep' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      response = get('/logout')
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<p>To post a new peep please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return the homepage with the session set to nil - This will prevent user from deleting a peep' do
      response = post('/signup', name: 'User', username: 'NewUser8', email_address: 'newuseremail8@mail.com', password: 'Password8')
      response = post('/loginpage', username: 'NewUser8', password: 'Password8')
      response = get('/logout')
      response = get('/delete_peep')
      expect(response.body).to include ('<p>To delete an exiting peep of yours, please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end
  end

  context '/delete_peep' do
    it 'Should only allow the user to delete a peep if they are logged into their account' do
      response = post('/signup', name: 'User', username: 'NewUser7', email_address: 'newuseremail7@mail.com', password: 'Password7')
      response = post('/loginpage', username: 'NewUser7', password: 'Password7')
      response = get('/delete_peep')
      expect(response.body).to include ('<h1>Delete a selected peep</h1>')
      expect(response.body).to include ('<p>Please input the title of the peep you would like to delete</p>')
      expect(response.body).to include ('<form method="POST" action="/delete_peep">')
      expect(response.body).to include ('<label>Title of peep:</label>')
      expect(response.body).to include ('<input type="text" name="title" autocomplete="off"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    it 'Should send the user to a new log in page if the user attempts to delete a peep without logging in' do
      response = get('/delete_peep')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<title>Delete a peep</title>')
      expect(response.body).to include ('<h1>Unable to delete a peep</h1>')
      expect(response.body).to include ('<p>To delete an exiting peep of yours, please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should delete the selected peep if the peep belongs to the user' do
      response = post('/signup', name: 'User', username: 'NewUser6', email_address: 'newuseremail6@mail.com', password: 'Password6')
      response = post('/loginpage', username: 'NewUser6', password: 'Password6')
      response = post('/peep/new', title: 'A fake title', content: 'A fake peep' )
      response = post('/delete_peep', title: 'A fake title')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<title>Peep deleted successfully</title>')
      expect(response.body).to include ('<h1>The peep "A fake title" was removed from chitter</h1>')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
    end

    it 'Should return a 400 error if user tries to delete a peep that they have not posted' do
      response = post('/signup', name: 'User', username: 'NewUser5', email_address: 'newuseremail5@mail.com', password: 'Password5')
      response = post('/loginpage', username: 'NewUser5', password: 'Password5')
      response = post('/delete_peep', title: 'A second peep')
      expect(response.status).to eq (400)
    end

    it 'Should return a 400 error if the user tries to delete a peep that does not exist' do
      response = post('/signup', name: 'User', username: 'NewUser4', email_address: 'newuseremail4@mail.com', password: 'Password4')
      response = post('/loginpage', username: 'NewUser4', password: 'Password4')
      response = post('/delete_peep', title: 'Non existent peep')
      expect(response.status).to eq (500) # Add an alternate fail here for this scenario. 
    end
  end

  context '/update_details' do
    it 'Should return a form page to update details if user is logged in' do
      response = post('/signup', name: 'User', username: 'NewUser3', email_address: 'newuseremail3@mail.com', password: 'Password')
      response = post('/loginpage', username: 'NewUser3', password: 'Password')
      response = get('/update_details')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Update your account details</h1>')
      expect(response.body).to include ('<form method="POST" action="/update_details">')
      expect(response.body).to include ('<label>New Name:</label>')
      expect(response.body).to include ('<input type="text" name="name" autocomplete="off"/>')
    end

    it 'Should redirect the user to a login style page if user is not logged in' do
      response = get('/update_details')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Unable to update your details</h1>')
      expect(response.body).to include ('<p>To update your account details you must be logged in</p>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should update the users name to new name' do
      response = post('/signup', name: 'Useragain', username: 'Useragain', email_address: 'email2@email.com', password: 'Passwordzz')
      response = post('/loginpage', username: 'Useragain', password: 'Passwordzz')
      response = post('/update_details', name: 'Hayley 2')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Name successfully updated</h1>')
      expect(response.body).to include ('You have updated your name to Hayley 2')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
    end
  end

  context '/userpage' do
    it 'Should not allow user to enter user page if not logged in' do
      response = get('/userpage')
      expect(response.status).to eq (200)
    end

    it 'Should return the userpage when user is logged in' do
      response = post('/signup', name: 'UserUser', username: 'NewUser1', email_address: 'emailok@email.com', password: 'Passwordpreenc')
      response = post('/loginpage', username: 'NewUser1', password: 'Passwordpreenc')
      response = get('/userpage')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/">Homepage</a>')
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/delete_peep">Delete a peep</a>')
      expect(response.body).to include ('<a href="/peeps/:id">View your previous peeps</a>')
      expect(response.body).to include ('<a href="/update_details">Update/change your details</a>')
      expect(response.body).to include ('<a href="/logout">Log out</a>')
    end
  end
end
