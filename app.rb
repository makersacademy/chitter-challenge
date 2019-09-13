require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/peep'
require './lib/user'
require './lib/userpeep'
require './lib/database_connection'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  #login page
  get '/' do
    erb(:index)
  end

  # submit form on login page, goes to peeps
  post '/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.user_id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/')
    end
  end

  # create new user, validating if email/handle already in use.
  post '/newsignup' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], handle: params[:handle])
    if user
      session[:user_id] = user.user_id
      redirect('/peeps')
    else
      flash[:notice] = "Email/Handle already in use, try again"
      redirect('/signup')
    end
  end
  
  # signup page
  get '/signup' do
    erb(:signup)
  end

  # peeps page
  get '/peeps' do
    erb(:peeps)
  end

  # submit form with NEW peep, updates same page
  post '/:id/postpeep' do
    Peep.create(content: params[:content], user_id: params[:id])
    redirect('/peeps')
  end





  run! if app_file == $0

end
