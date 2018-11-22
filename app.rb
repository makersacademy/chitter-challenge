require 'sinatra/base'
require './lib/peeps.rb'
require './lib/users.rb'


class Controller < Sinatra::Base
  enable :sessions
  get '/' do
    @peeps = Peeps.all
    erb(:index)
  end

  post '/peeps/post' do
    Peeps.create(session[:user_id], params['peep_content'])
    redirect('/')
  end

  get '/users/register' do
    erb(:register)
  end

  post '/users/register' do
    if Users.register(params['name'], params['password'], params['Username'], params['email'])
      session[:user_id] = Users.get_id(params['Username'])
      session[:username] = params['Username']
      session[:logged_in] = true
      redirect('/')
    else
      redirect('/users/fail')
    end
  end

  get '/users/fail' do
    erb('registration_failure.erb')
  end

  post '/users/login' do
    if Users.login(params['login_username'], params['login_password'])
      session[:user_id] = Users.get_id(params['login_username'])
      session[:username] = params['login_username']
      session[:logged_in] = true
      redirect('/')
    else
      redirect('/users/register')
    end
  end

  get '/users/logout' do
    session[:user_id] = nil
    session[:username] = nil
    session[:logged_in] = false
    redirect('/')
  end



end
