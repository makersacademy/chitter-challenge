ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable(:sessions)
  set :session_secret, 'super secret'
  register Sinatra::Flash 

  get '/' do
    @user = User.new
    @user_id = session[:user_id]
    erb(:index)
  end

  post '/names' do
    @user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect("/peep")
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:index)
    end
  end

  post '/new' do
    p params
    peep = Peep.create(text: params[:text], user: current_user)
    redirect(:peep)
  end

  get '/peep' do
    @user_id = session[:user_id]
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb(:peep)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end