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
      expect(response.body).to include ('<img src=></img>')
    end

    it 'Should include 5 different hyperlinks' do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/peeps">View all peeps</a>')
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/loginpage">Log in</a>')
      expect(response.body).to include ('<a href="/signup">Sign up</a>')
      expect(response.body).to include('<a href="/userpage">My account</a>')
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
      expect(response.body).to include ('<input type="text" name="username"/>')
      expect(response.body).to include ('<input type="text" name="password"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    it 'Should return an error page when username is not present within the DB' do
      response = post('/loginpage', username: 'FakeUsername', password: 'Password1!')
      expect(response.status).to eq(500)  # add an alternate fail test here. 
    end

    it 'Should return an alternate/error page when password is incorrect' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Login unsuccessful')
      expect(response.body).to include ('<p>Please return to the login page and try again</p>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Matty Boi')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Hayley Lady')
    end

    it 'Should return a list of user options as hyperlinks' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
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
      expect(response.body).to include ('<input type="text" name="name"/>')
      expect(response.body).to include ('<label>Username:</label>')
      expect(response.body).to include ('<input type="text" name="username"/>')
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
      response = post('/signup', name: 'Matt H', username: 'MattAlt', email_address: nil, password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when an input is empty' do
      response = post('/signup', name: 'Matt H', username: '', email_address: 'fakestofthemall@testmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end
  end

  # Spec tests which require session to be live:

  context 'peep/new' do
    it 'Should return an error page with hyperlinks to log in if user is not logged in already' do
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<p>To post a new peep please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return a form page to create a new peep if the user is logged in' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Post a new peep to Chitter</h1>')
      expect(response.body).to include ('<form method="POST" action="/peep/new">')
      expect(response.body).to include ('<input type="text" name="content"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    it 'Should only allow users logged into their account to successfully create new peeps' do
      response = post('/peep/new', title: 'new title', content: 'This is some content yes')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Your Peep was successfully posted!</h1>')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
      expect(response.body).to include ('<a href="/">Homepage</a>')
    end
  end

  context '/peeps/:id' do
    it 'Should return all peeps by passed maker in a formatted HTML list only if user is logged in' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      response = get('/peeps/2')
      expect(response.status).to eq (200)
      expect(response.body).to include ('Hayley Ladys Peeps')
      expect(response.body).to include ('Hayleys peep')
      expect(response.body).to include ('2023-07-21 12:25:12')
    end

    it 'Should return all peeps by passed maker in a formatted HTML list only if user is logged in' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = get('/peeps/1')
      expect(response.status).to eq (200)
      expect(response.body).to include ('Matty Bois Peeps')
    end

    it 'Should return all peeps by passed maker in a formatted HTML list only if user is logged in' do
      response = post('/signup', name: 'Fake User', username: 'faketest', email_address: 'faketestemail@gmail.com', password: 'fakepassword')
      response = post('/loginpage', username: 'faketest', password: 'fakepassword')
      response = post('/peep/new', title: 'A new pretend peep', content: 'This is some content')
      response = get('/peeps/3')
      expect(response.status).to eq (200)
      expect(response.body).to include ('Fake Users Peeps')
      expect(response.body).to include ('A new pretend peep')
      expect(response.body).to include ('This is some content')
    end

    it 'Should return the log in page if user is not logged in/no active session' do
      response = get('/peeps/2')
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
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = get('/logout')
      response = get('/delete_peep')
      expect(response.body).to include ('<p>To delete an exiting peep of yours, please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end
  end

  context '/delete_peep' do
    it 'Should only allow the user to delete a peep if they are logged into their account' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = get('/delete_peep')
      expect(response.body).to include ('<h1>Delete a selected peep</h1>')
      expect(response.body).to include ('<p>Please input the title of the peep you would like to delete</p>')
      expect(response.body).to include ('<form method="POST" action="/delete_peep">')
      expect(response.body).to include ('<label>Title of peep:</label>')
      expect(response.body).to include ('<input type="text" name="title"/>')
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
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      response = post('/delete_peep', title: 'Hayleys alternate peep')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<title>Peep deleted successfully</title>')
      expect(response.body).to include ('<h1>The peep "Hayleys alternate peep" was removed from chitter</h1>')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
    end

    it 'Should return a 400 error if user tries to delete a peep that they have not posted' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      response = post('/delete_peep', title: 'A second peep')
      expect(response.status).to eq (400)
    end

    it 'Should return a 400 error if the user tries to delete a peep that does not exist' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      response = post('/delete_peep', title: 'Non existent peep')
      expect(response.status).to eq (500)  #Add an alternate fail here for this scenario. 
    end
  end

  # context '/update_details' do
  #   it 'Should return a form page to update details if user is logged in' do
  #     response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
  #     response = get('/update_details')


  #   end

  #   it 'Should redirect the user to a login style page if user is not logged in' do
  #     response = get('/update_details')
  #   end

  #   it 'Should ' do

  #   end
  # end

  context '/userpage' do
    it 'Should not allow user to enter user page if not logged in' do
      response = get('/userpage')
      expect(response.status).to eq (200)
    end

    it 'Should return the userpage when user is logged in' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      response = get('/userpage')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/">Homepage</a>')
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/delete_peep">Delete a peep</a>')
      expect(response.body).to include ('<a href="/peeps/:id">View your previous peeps</a>')
      expect(response.body).to include ('<a href="/update">Update/change your details</a>')
      expect(response.body).to include ('<a href="/logout">Log out</a>')
    end
  end
end
