
ENV["RACK_ENV"] ||= "development" # ensures app runs in development mode by default

require 'sinatra/base'
require './models/data_mapper_setup'
require 'sinatra/flash'


class ChitterChallenge < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    if current_user
      redirect '/peep'
    else
      redirect '/session/new'
    end
  end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(email: params[:email],
                      name: params[:name],
                      user_name: params[:user_name],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user.save
  session[:user_id] = @user.id
  redirect to('/peep')
  else
  flash.now[:errors] = @user.errors.full_messages
  erb :'users/new'
  end
end

get '/session/new' do
  erb :'session/new'
end

post '/session' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/peep'
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'session/new'
  end
end


delete '/session' do
  session[:user_id] = nil
  flash.keep[:notice] = 'Goodbye!'
  redirect to '/peep'
end


get '/peep' do
    @peeps ||= Peep.reverse_chronological
  erb :peep
end

post '/peep' do
  peep = Peep.create(peep: params[:peep])
      current_user.peeps << peep
      current_user.save
  redirect '/peep'
end



  # start the server if ruby file executed directly
  run! if app_file == $0

end
