require 'sinatra/base'
require_relative './database_connection_setup'
require 'sinatra/flash'
require_relative 'lib/peeps'
require_relative 'lib/user'
require_relative 'lib/tags'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :'index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peeps.create(message: params[:peep], user_id: session[:user_id])
    if params[:taggeduser] != ""
      tagged = Tags.create(tag: params[:taggeduser], id: @peep.id)
      if tagged == 'Username Not Found'
          Peeps.delete(id: @peep.id)
          flash[:notice] = 'Username Not Found'
          redirect back
      elsif tagged == 'Already Tagged'
          Peeps.delete(id: @peep.id)
          flash[:notice] = 'Already Tagged'
          redirect back
      else
        redirect '/peeps'
      end
    end
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username],email: params[:email], password: params[:password])

    if user == 'Email Taken'
      flash[:notice] = 'This email address is already in use.'
      redirect '/users/new'
    elsif user == 'Username Taken'
      flash[:notice] = 'This username is not available.'
      redirect '/users/new'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $0

end
