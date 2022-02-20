require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
    redirect '/new_peeps'
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

  run! if app_file == $0
end