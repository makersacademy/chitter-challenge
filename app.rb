require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/partial'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Partial
  end

  enable :sessions

  get '/' do
    @peep = session[:peep]
    erb(:index)
  end

  post '/peep' do
    params.inspect
    session[:peep] = params[:peep]
    redirect('/')
  end

  run! if app_file == $0
end