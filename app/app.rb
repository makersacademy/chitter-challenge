ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'helper'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    params[:tags].split.each do |tag|
      peep.tags << Tag.first_or_create(name: params[:tags])
    end
    peep.save
    redirect to('/peeps')
  end

  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @peeps = tag ? tag.peeps : []
  erb :'peeps/index'
  end
end
