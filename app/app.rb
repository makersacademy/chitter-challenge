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

  run! if app_file == Chitter

end
