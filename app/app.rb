require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/peeps'
  end

  # get '/peeps/new' do
  #
  # end

  # post '/users' do
  #
  # end

  # get '/users' do
  #
  # end

  get '/users/new' do
    erb :'users/new'
  end

  # post '/users' do
  #
  # end

  run! if app_file == $0
end
