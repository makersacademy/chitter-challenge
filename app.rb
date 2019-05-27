require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/post' do
    erb(:post)
  end

  post '/peeps/post' do
    Peep.post(text: params[:text])
    redirect '/'
  end

  get '/users/signup' do
    erb(:signup)
  end

  post '/users/signup' do
    session[:unique_email] = User.unique_email?(params[:email])
    redirect '/users/signup-fail' unless session[:unique_email]

    User.sign_up(email: params[:email], password: params[:password],
                 name: params[:name], username: params[:username])

    redirect '/'
  end

  get '/users/signup-fail' do
    erb(:signup_fail)
  end

  run! if app_file == $0
end
