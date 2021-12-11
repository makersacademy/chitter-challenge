require 'sinatra/base'
require 'sinatra/reloader'

require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    if session[:logged_in_user_id]
      user = DatabaseConnection.query(
        "SELECT * 
        FROM Users 
        WHERE id = $1;", 
        [session[:logged_in_user_id]]
      )
      @logged_in_user = User.new(
        name: user[0]['name'], 
        username: user[0]['username'], 
        email: user[0]['email']
      )
    end
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    DatabaseConnection.query(
      "INSERT INTO Users(email, password, name, username) 
      VALUES($1, $2, $3, $4);", 
      [params['email'], params['password'], params['name'], params['username']]
    )
    user_id = DatabaseConnection.query("SELECT id FROM Users WHERE email = $1", [params['email']])
    session[:logged_in_user_id] = user_id[0]['id']
    redirect '/'
  end

  get '/log-in' do
    erb :login
  end

  post '/log-in' do
    id = DatabaseConnection.query(
      "SELECT id 
      FROM Users 
      WHERE email = $1 AND password = $2;", 
      [params['email'], params['password']]
    )
    if id[0]['id'].nil?
      @invalid_login = true
      erb :login
    else
      session[:logged_in_user_id] = id[0]['id']
      redirect '/'
    end
  end

  get '/logout' do
    session[:logged_in_user_id] = nil
    # add flash message you've succesfuly logged out
    redirect '/'
  end

  run! if app_file == $0
end
