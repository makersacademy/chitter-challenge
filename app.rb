require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/' do
    Peep.new(params[:content])
    redirect '/'
  end

  run! if app_file == $0
end
