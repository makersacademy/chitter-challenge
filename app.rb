require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'uri'
class ChitterManager < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/post' do
    redirect('/')
  end

  run! if app_file == $0
end
