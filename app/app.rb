ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
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
    Peep.create(peep_content: params[:peep_content])
    redirect '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
