ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post' do
    Peep.create(content: params[:peep])
    redirect to('/')
  end

  run! if app_file == $PROGRAM_NAME
end
