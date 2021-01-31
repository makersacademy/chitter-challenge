require 'sinatra'
require './lib/peep'
require './db_connection_setup'
require './lib/user'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    p session[:user_id]
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
    user = User.create(name: params[:name], username: params[:username],
                    email_address: params[:email_address], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

end
