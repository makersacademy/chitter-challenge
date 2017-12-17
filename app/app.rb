ENV["RACK_ENV"] ||= "development"
require 'date'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "super secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/user/new' do
    @user = User.new
    erb(:signup)
  end

  post '/user' do
    @user = User.create(email: params[:email],
                       name: params[:name],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Your passwords do not match!"
      erb(:signup)
    end
  end

  get '/peep/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    Peep.create(message: params[:message], user: current_user, time: Time.new)
    redirect '/'
  end

  run! if app_file == $0

end
