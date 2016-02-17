require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username], text: params[:text])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    redirect to('/peeps/new')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
