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

  get '/' do
    erb(:index)
  end

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

  post '/newsignup' do
    user = User.create(name: params[:name], email: params[:email],
       password: params[:password], handle: params[:handle])
    if user
      session[:user_id] = user.user_id
      redirect('/peeps')
    else
      flash[:notice] = "Email/Handle already in use, try again"
      redirect('/signup')
    end
  end

  get '/signup' do
    erb(:signup)
  end

  get '/peeps' do
    if session[:user_id] != nil
      @peeps = UserPeep.all.reverse
    else
      flash[:notice] = "You must log in to see Peeps!"
      redirect('/')
    end
    erb(:peeps)
  end

  post '/postpeep' do
    if session[:user_id] != nil
      newpeep = Peep.create(content: params[:content])
      UserPeep.create(user_id: session['user_id'], peep_id: newpeep.id)
      redirect('/peeps')
    else
      redirect('/')
      flash[:notice] = "You must be logged in to post a peep!"
    end
  end

  post '/peeps/signout' do
    session.clear
    flash[:notice] = "You have been signed out. Please log back in to continue."
    redirect('/')
  end

  run! if app_file == $0

end
