require 'sinatra/base'
require 'sinatra/flash'
require_relative 'helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  get '/feed/new' do 
    erb :new_peep
  end

  post '/feed' do 
    Peep.create(message: params[:message])
    redirect to('/feed')
  end

  get '/users/new' do 
    @user = User.new
    erb :new_user
  end

  post '/users' do 
    @user = User.new(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/feed')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  get '/sessions/new' do
    erb :new_sessions
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/feed')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :new_sessions
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
