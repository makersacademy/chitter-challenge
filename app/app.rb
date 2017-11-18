ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_config'
require_relative './models/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  post '/peeps' do
    Peep.create(text: params[:peep], added: Time.now)
    redirect '/peeps'
  end

  run! if app_file == $0
end
