ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end
end

