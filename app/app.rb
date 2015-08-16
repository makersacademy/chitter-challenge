require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
  # set :views, proc { File.join(root, '..', 'views') }
end
