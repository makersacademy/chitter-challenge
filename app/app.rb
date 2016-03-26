ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chit'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/new' do
    erb :'chits/new'
  end

  post '/new' do
    chit = Chit.create(post: params[:post], time: Time.now.strftime("%d/%m/%Y %H:%M"))
    params[:tags].split.each do |tag|
      chit.tags << Tag.create(name: params[:tags])
    end
    chit.save
    redirect('/chits')
  end

  get '/search/:name' do
    tag = Tag.all(name: params[:name])
    @chits = tag ? tag.chits : []
    erb :'chits/index'
  end


end
