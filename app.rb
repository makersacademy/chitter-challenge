require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peeps' do
    Peep.create(message: params[:peep])
    redirect '/'
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username],
                     email: params[:email], password: params[:password],
                     password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:alert] = @user.errors.full_messages
      erb :sign_up
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
