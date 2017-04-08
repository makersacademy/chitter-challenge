ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    hashtag = Hashtag.first_or_create(name: params[:hashtags])
    peep.hashtags << hashtag
    peep.save
    redirect '/peeps'
  end
end
