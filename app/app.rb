ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/data_mapper_setup'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/posts' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/posts' do
    Peep.first_or_create(post_text: params[:post_text], created_at: params[:created_at])
    redirect '/posts'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = user.errors.full_messages
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
