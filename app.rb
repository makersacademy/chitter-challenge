require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash

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

  post '/post-peep' do
    peep_id = DatabaseConnection.query(
      "INSERT INTO Peeps(user_id, time, content)
      VALUES($1, $2, $3)
      RETURNING id;",
      [session[:logged_in_user_id], Time.now, params['peep']]
    )
    p "PARAMS TAGS: #{params['tags']}"
    unless params['tags'] == ""
      tags = params['tags'].split(',')
      tags.each { |tag| p "TAG ELEMENT: #{tag}"}
      tags.each do |tag|
        tagged_user_id = DatabaseConnection.query(
          "SELECT id
          FROM Users
          WHERE username = $1;",
          [tag]
        )
        if tagged_user_id.num_tuples.zero?
          flash[:invalid_tag] = "#{tag} does not have a chitter account and will not be added to your peep"
        else
          DatabaseConnection.query(
            "INSERT INTO junction_tagged_users(peep_id, user_id)
            VALUES($1, $2);",
            [peep_id[0]['id'], tagged_user_id[0]['id']]
          )
        end
      end
    end
    redirect '/'
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
    
    if id.num_tuples.zero?
      flash[:invalid_login] = "Invalid login, please check email and password are correct</h4>
      <h4>Haven't signed up yet? <a href='/sign-up'>Sign up here</a></h4>"
      redirect '/log-in'
    else
      session[:logged_in_user_id] = id[0]['id']
      redirect '/'
    end
  end

  get '/logout' do
    session[:logged_in_user_id] = nil
    flash[:notice] = "You have sucessfully logged out of your Chitter account"
    redirect '/'
  end

  run! if app_file == $0
end
