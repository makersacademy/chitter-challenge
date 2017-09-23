require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/peep.rb'
require_relative './models/user.rb'
ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    'You arrived at the homepage'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
  @user = User.create(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end

  end

  post '/peeps' do
    peep = Peep.new(title: params[:title], text: params[:text])
    peep.save
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
