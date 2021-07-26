require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/create_peep' do
    erb(:create_peep)
  end

  post '/submit_peep' do
    Peep.create(name: params[:user_name], content: params[:content])
    redirect to('/')
  end
end
