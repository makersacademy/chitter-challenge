require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    @signed_up = !session[:userid].nil?
    @name = session[:name]
    erb(:index)
  end

  get '/peeps/post' do
    erb(:post)
  end

  post '/peeps/post' do
    Peep.post(text: params[:text], userid: session[:userid])
    redirect '/peeps'
  end

  get '/users/signup' do
    erb(:signup)
  end

  post '/users/signup' do
    session[:unique_email] = User.unique_email?(params[:email])

    unless session[:unique_email] && User.unique_username?(params[:username])
      redirect '/users/signup/fail'
    end

    user = User.sign_up(email: params[:email], password: params[:password],
                        name: params[:name], username: params[:username])

    session[:userid] = user.id
    session[:name] = user.name

    redirect '/peeps'
  end

  get '/users/signup/fail' do
    session[:unique_email] ? @fail = 'Username in use' : @fail = 'Email in use'
    erb(:signup_fail)
  end

  run! if app_file == $0
end
