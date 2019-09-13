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
      session[:username] = user.handle
      session[:email] = user.email
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
      session[:username] = user.handle
      session[:email] = user.email
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
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  # submit form with NEW peep, updates same page
  post '/postpeep' do
    newpeep = Peep.create(content: params[:content])
    UserPeep.create(user_id: session['user_id'], peep_id: newpeep.id)
    redirect('/peeps')
  end

  post '/peeps/signout' do
    session.clear
    flash[:notice] = "You have been signed out. Please log back in to continue."
    redirect('/')
  end





  run! if app_file == $0

end
