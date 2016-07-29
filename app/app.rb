
ENV["RACK_ENV"] ||="test"
#don't forget to change this!

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'


class Chitter < Sinatra::Base


  get '/' do
    'Hello Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(comment: params[:comment])
    peep.save
    redirect to('/peeps')
  end


  get '/peeps/new' do
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
