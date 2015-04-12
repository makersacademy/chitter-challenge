require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'
require 'sinatra/partial'
require 'rack-flash'
require_relative 'lib/user'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

class Chitter < Sinatra::Base

  include Helpers

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    erb :homepage
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      flash[:errors] = nil
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash[:notice] = "Good bye!"
    session[:user_id] = nil
    redirect to('/')
  end

end

require_relative 'controllers/users'
require_relative 'controllers/sessions'