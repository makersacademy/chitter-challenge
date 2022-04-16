require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world'
  end

  get '/chitter/peeps/new' do
    @new_peep = params[:peeps]
    erb :'posts/new'
  end

  post '/chitter/peeps/new/add' do

  end

  run! if app_file == $0
end
