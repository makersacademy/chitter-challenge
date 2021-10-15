require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter' do
    @peeps = Chitter.all
    erb :index
  end

  # post '/chitter/new' do
  #   # p params[:name] 
  #   # p params[:peep]
  #   "I'm a Pull Stack Developer. I pull things off the internet and put it in my code."
  #   redirect '/chitter'
  # end

  run! if app_file == $0
end
