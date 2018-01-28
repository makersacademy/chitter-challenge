ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require './app/model/peep'
require './app/model/user'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'really really secret'
  register Sinatra::Flash

  get '/' do
    # @recipient = "stranger"
    # @recipient = current_user.username if current_user
    erb :index
  end

  get '/users/new' do
    erb :new_user
  end

  post '/submit_registration' do
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:confirm_password],
      name: params[:name],
      username: params[:username]
    )
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:notice]
      erb :new_user
    end
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/submit_peep' do
    peep = Peep.create(body: params[:content])
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
