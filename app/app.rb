require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    chit = Chit.create(post: params[:post])
    tag  = Tag.create(name: params[:tag])
    chit.tags << tag
    chit.save
    redirect to('/chits')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @chits = tag ? tag.chits : []
    erb :'chits/index'
  end

  run! if app_file == Chitter

end
