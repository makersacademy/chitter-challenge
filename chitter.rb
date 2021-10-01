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

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    Peep.create(name: params[:user_name], content: params[:content])
    redirect to('/')
  end

  get '/users/new' do
    erb(:new_user)
  end

  post '/users' do
    
    redirect to('/')
  end
end
