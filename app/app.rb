require 'sinatra/base'
require_relative 'modles/peep'
require_relative 'datamapper_setup'
require_relative 'lib/time'


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

get '/messages' do
  @peeps = Peep.all
  erb :'messages/index'
end

  post '/messages' do
    if session[:user_id]
      Peep.create(peep: params[:peep], time: TodaysDate.new.todays_date_toady)
    else
      flash.keep[:notice] = "Sorry You need to be signed in to peep"
    end
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/messages'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/messages')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/users' do
    user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     name: params[:name],
                     user_name: params[:user_name])
     if user.save
        session[:user_id] = user.id
        redirect to('/messages')
      else
        flash.now[:errors] = user.errors.full_messages
        erb :'users/new'
      end
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

run! if app_file == $0
end
