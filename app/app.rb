ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra'
require 'sinatra/flash'
require 'dm-validations'
require_relative './models/peep.rb'
require_relative './models/user.rb'
require_relative './data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    haml(:index)
  end

  get '/about' do
    haml(:about)
  end

  get '/peep/all' do
    @peeps = Peep.all
    erb(:'peep/all')
  end

  post '/peep/all' do
    Peep.create(message: params[:message])
    redirect '/peep/all'
  end

  get '/peep/new' do
    erb(:'peep/new')
  end

  get '/user/new' do
    haml(:'user/new')
  end

  post '/user/new' do
    user = User.new(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peep/all'
    else
      flash[:error] = user.errors.full_messages.join(" and ")
      flash[:email] = params[:email]
      flash[:username] = params[:username]
      redirect to '/user/new'
    end
  end

  get '/sessions/sign_in' do
    erb(:'sessions/sign_in')
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    session[:user_id] = user.id
    redirect '/peep/all'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/peep/all'
  end
end
