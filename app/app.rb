require 'sinatra/base'
require 'sinatra/flash'
require './app/support/data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

helpers do
  def current_user
    @current_user || User.get(session[:user_id])
  end

  def peeps
    if Peep.all.length > 0
      Peep.all(:order => [:created_at.desc])
    end
  end
end

  get '/' do
    erb :index
  end

  get '/users/register' do
    erb(:'users/register')
  end

  post '/users/register' do
    user = User.create(
      email:                  params[:email],
      name:                   params[:name],
      username:               params[:username],
      password:               params[:password],
      password_confirmation:  params[:password_confirmation]
      )
    if user.save
      redirect '/'
    end
    flash.now[:errors] = user.errors.full_messages
    erb(:'/users/register')
  end

  get '/users/sign_in' do
    erb(:'users/sign_in')
  end

  post '/users/sign_in' do
    if user = User.validate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect('/')
    end
    flash[:errors] = "Username or password incorrect"
    erb(:'users/sign_in')
  end

  post '/sign_out' do
    session.delete(:user_id)
    flash.next[:notice] = "You have been signed out"
    redirect ('/')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    if peep = Peep.create(content: params[:new_peep], user: current_user) && current_user
      redirect '/'
    end
    flash.now[:errors] = peep.errors.full_messages
    erb(:'/peeps/new')
  end

  run! if app_file == $0
end