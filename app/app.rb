ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(created_at: Time.now, content: params[:content])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
