ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'shhh'
  register Sinatra::Flash

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    params[:tags].split(', ').each do |tag|
      peep.tags << Tag.first_or_create(name: tag)
    end
    peep.save
    redirect to '/peeps'
  end

  get '/peeps/:name' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:notice] = 'Passwords do not match'
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
