ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/' do
    Peep.create(name: params[:name], content: params[:peep], time_submitted: Time.now)
    redirect '/'
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/users' do
    @user = User.new(username: params[:username], 
      email: params[:email], 
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      if @user.password != @user.password_confirmation
        flash.now[:notice] = "Password and confirmation password do not match"
      else
        flash.now[:notice] = "Provided email is invalid"
      end
      erb :signup
    end
  end

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
 end
  # start the server if ruby file executed directly
  run! if app_file == $0
end