ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @new_peep = false
    @signed_in = false
    @posts = Peep.all
    erb :index
  end
  
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/compose_peep' do
    @new_peep = true
    erb :index
  end

  post '/update_peeps' do
    Peep.new(message: params[:message], time: "#{Time.now.strftime('%H:%M')}").save
    redirect '/'
  end

  run! if app_file == $0
end
