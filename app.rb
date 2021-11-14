require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader

    enable :sessions, :method_override
  end

  get '/' do
    'Welcome to Chitter'
    erb(:index)
  end

  get '/peeps' do
    p ENV
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/post_peep' do
    Chitter.create(message: params[:message])
    redirect '/post_peep'
  end





  run! if app_file == $0
end