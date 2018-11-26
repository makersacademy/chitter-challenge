require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'


class Chitter < Sinatra::Base
  enable :sessions, :method_override 
  register Sinatra::Flash

  get '/' do
    erb :'user_log_in'
  end

  post '/' do
    user = User.authenticate(email: params[:login_email], password: params[:login_password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect back
    end
  end

  get '/user_sign_in' do
    erb :'user_sign_in'
  end

  post '/user_sign_in' do
    user = User.create(email: params[:signup_email], password: params[:signup_password], name: params[:signup_name])
    # session[:user_id] = user.id
    (flash[:notice] = 'Sign in successful, please click [Back] and log in Chitter') if (user)
    redirect back
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id]) 
    erb :'peeps'
  end

  post '/peeps' do
    Peep.create(content: params['content'])
    redirect back
  end

  run! if app_file == $0
end