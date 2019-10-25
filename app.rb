require 'sinatra/base'
require './lib/sql'
class Chitter < Sinatra::Base 
  enable :sessions
  get '/' do
    @output =  SQL.select_all_peeps.to_a
    erb :index
  end  
  get '/signup' do 
    erb :signup
  end
  get '/login'  do
    erb :login
  end
  post '/process-signup' do 
    SQL.insert_new_user(name: params['name'], email: params['email'], username: params['username'], password: params['password'])
    redirect '/'
  end
  post '/process-login' do 
    isLoggedin = SQL.login(username: params['username'], password: params['password'])
    if isLoggedin == true
    session[:loggedin] = true
    session[:username] = params['username']
    session[:id] = SQL.select_user_id(username: session['username'])
    redirect '/' 
    else 
    redirect '/login'
   # @error = "Username or password is invalid, please try again."
    end
  end
  post '/submit-peep' do 
    if params['text'].empty?
      redirect '/'
    else
      time = Time.new 
      current_time = time.strftime("%d-%m-%y %H:%M:%S")
      SQL.insert_new_peep(text: params['text'], post_time: current_time, id: session['id'])
      redirect '/'
    end
  end
  post '/process-logout' do 
    session[:loggedin] = nil
    session[:username] = nil
    redirect '/'
  end
  run! if app_file == $0
end
