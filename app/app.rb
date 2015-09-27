require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  include Helper

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(post: params[:post])
    tags = params[:tags].split(' ')
    tags.each do |tag|
      tag  = Tag.create(name: tag)
      peep.tags << tag
    end
    peep.save
    redirect to('/peeps')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                handle: params[:handle],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:handle], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to('/sessions/new')
  end

  run! if app_file == Chitter

end
