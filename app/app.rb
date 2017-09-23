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
    peep = Peep.new(message: params[:message])
    tag  = Tag.first_or_create(name: params[:tags])
    peep.tags << tag
    peep.save
    redirect to('/peeps')
  end
end
