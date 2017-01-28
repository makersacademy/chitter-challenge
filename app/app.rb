ENV['RACK_ENV']||='development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/peep'
require_relative './models/tag'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content], time: Time.new)
    params[:tags].split.each do |tag|
      peep.tags << Tag.create(name: tag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  get '/tags' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
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