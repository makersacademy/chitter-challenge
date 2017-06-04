ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  get '/add_peep' do
    erb :add_peep
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
  end

  run! if app_file == $0
end
