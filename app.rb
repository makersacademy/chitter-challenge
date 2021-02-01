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
    @duplicate_email = params[:duplicate_email]
    @duplicate_user = params[:duplicate_user]
    p 'user', @duplicate_user, 'email', @duplicate_email
    erb :new_user
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
                    email_address: params[:email_address], password: params[:password])
    if user.is_a?(User)
      session[:user_id] = user.id
      redirect '/'
    else
      redirect "/users/new?duplicate_user=#{user[:duplicate_user]}&duplicate_email=#{user[:duplicate_email]}"
    end
  end

end
