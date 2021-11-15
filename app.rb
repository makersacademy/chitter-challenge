

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
    @peeps = Peep.all
    p @peeps
    erb(:peeps)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: params[:time])
    redirect '/peeps'
  end





  run! if app_file == $0
end