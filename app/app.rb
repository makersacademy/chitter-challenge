require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  include Helper

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

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
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email],
                handle: params[:handle],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  run! if app_file == Chitter

end
