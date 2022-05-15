require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/board' do
    @peeps = Peep.show
    erb :'/peeps/board'
  end

  get '/peeps/message' do
    erb :'/peeps/message'
  end
  
  post '/peeps/message' do
    Peep.post(params[:message])
    redirect '/board'
  end

  run! if app_file == $0
end
