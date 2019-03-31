require 'sinatra/base'
require 'pg'
require_relative 'lib/cheep'

class ChitterApp < Sinatra::Base

  get '/' do
    @posts = Cheep.all
    erb :index
  end

  post '/post' do
    Cheep.post(params[:content])
    redirect '/'
  end

  run! if app_file == $0
end
