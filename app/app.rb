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
  use Rack::MethodOverride

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(user_handle: current_user.user_name, user_name: current_user.name, content: params[:content], time: Time.new)
    params[:tags].split.each do |tag|
      peep.tags << Tag.create(name: tag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/newpeeps' do
  	erb :'peeps/new'
  end

  get '/tags' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  get '/newusers' do
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

  get '/newsessions' do
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

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'See Ya!'
    redirect to '/peeps'
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end