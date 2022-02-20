require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/new_peeps' do
    erb :new_peeps
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  # post '/' do
  #   # Peep.create(peep: params["peep"], name: params["name"], username: params["@username"], time: params["time"])
  #   redirect to('/')
  # end



  run! if app_file == $0
end