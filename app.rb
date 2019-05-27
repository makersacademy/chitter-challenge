require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/post' do
    erb(:post)
  end

  post '/peeps/post' do
    Peep.post(text: params[:text])
    redirect '/'
  end

  get '/users/signup' do
    erb(:signup)
  end

  post '/users/signup' do
    p params
  end

  run! if app_file == $0
end
