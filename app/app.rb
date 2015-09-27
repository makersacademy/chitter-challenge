require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers'

class Chitter < Sinatra::Base

  include Helper

  enable :sessions
  set :session_secret, 'super secret'

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    chit = Chit.create(post: params[:post])
    tags = params[:tags].split(' ')
    tags.each do |tag|
      tag  = Tag.create(name: tag)
      chit.tags << tag
    end
    chit.save
    redirect to('/chits')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @chits = tag ? tag.chits : []
    erb :'chits/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email],
                handle: params[:handle],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/chits')
  end

  run! if app_file == Chitter

end
