require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
# require 'sinatra/flash'

class Chitter < Sinatra::Base


  set :root, File.dirname(__FILE__)

  enable :sessions

  get '/' do
    'Hello Chitter!'

  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
