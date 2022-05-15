require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/home' do
    @peeps = Peep.all
    erb :'/peeps/home'
  end

  get '/peeps/message' do
    erb :'/peeps/message'
  end
  
  post '/peeps/message' do
    Peep.post(message: params[:message])
    redirect '/home'
  end

  run! if app_file == $0
end
