require 'sinatra'
require './lib/peep'
require './db_connection_setup'
require './lib/user'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user_id = session[:user_id]
    erb :index
  end

  post '/peeps' do
    Peep.new_peep(params[:content], Time.now)
    redirect "/"
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    password_hashed = BCrypt::Password.create(params[:password])
    column_arr = ['name', 'username', 'email_address', 'password']
    values_arr = [params[:name], params[:username], params[:email_address], password_hashed]
    results = DBConnection.insert(table: 'chitterer', columns: column_arr, values: values_arr).first
    session[:user_id] = results['id']
    redirect '/'
  end

end
