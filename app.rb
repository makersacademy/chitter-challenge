require 'sinatra'
require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './lib/datamapper'
require 'sinatra/flash'
require './lib/login'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/post' do
    p "#{session[:user]}"
    Peep.create(peep: params[:peep],
                created_at: Time.now,
                user_id: User.first("user" => "#{session[:user]}")[:id])
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    if Login.user_exists?(params[:username])
      flash[:user_exists] = "that username is already taken"
      redirect '/register'
    else
      session[:user] = params[:username]
      User.create user: params['username'], firstname: params['firstname'], lastname: params['lastname'], email: params['email'], password: params[:password]
      redirect '/'
    end
  end

  post '/sign_in' do
    if Login.user_pass_ok?(params[:username], params[:password])
      session[:user] = params[:username]
    else
      flash[:notice] = "incorrect username or password"
    end
    redirect '/'
  end

  get '/logout' do
    session[:user] = nil
    redirect '/'
  end
end
