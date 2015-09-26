require 'sinatra/base'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'helpers'

class ChitterApp < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  helpers Helpers

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message]) unless params[:message].empty?
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
