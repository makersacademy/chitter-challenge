require 'sinatra'
require './lib/peep'
require './lib/user'
class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users/' do
    who = params['username']
    password = params['password']
    email = params['email address']
    unless User.valid_signup(handle: who, mail: email)
      User.create(usr: who, pass: password, email: email)
      User.sign_in(user: who, pass: password)
      redirect '/peeps'
    else
      redirect '/sign_in/invalid'
    end
  end

  post '/sign_in/verify' do
    User.sign_in(user: params['username'], pass: params['password'])
    if User.logged_in == false
      redirect ('/sign_in/invalid')
    else
      redirect ('/peeps')
    end
  end

  get '/sign_in/invalid' do
    erb(:invalid_login)
  end

  get '/sign_in' do
    erb(:sign_in)
  end

  get '/sign_out' do
    User.log_out
    redirect '/'
  end

  get '/peeps' do
    @posts = Peep.all
    @username = User.logged_in
    erb(:view_peeps)
  end
  

  post '/peeps' do
    message = params['peep text']
    person = Peep.userid(params['username'])
    Peep.create(text: message, user: person) 
    redirect '/peeps'
  end
end