require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/comment' do
    erb :comment
  end

  post '/comment' do
    Peeps.create(time: Time.now, message: params[:message], username: params[:username])
  end

  run! if app_file == $0
end
