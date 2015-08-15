require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: Time.now)
    redirect to('/peeps')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
