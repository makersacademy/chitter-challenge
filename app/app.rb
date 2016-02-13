ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/' do
    Peep.create(name: params[:name], content: params[:peep])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
