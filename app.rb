require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/add_peeps' do
    Peep.create(content: params['content'])
    redirect '/'
  end

  run! if app_file == $0
end
