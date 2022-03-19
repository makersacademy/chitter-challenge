require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
   redirect '/peeps'
  end

  # post 'peeps/new' do
  #   redirect '/peeps'
  # end

  # get '/peeps/new' do
  #   erb:new
  # end

  get '/peeps' do
    erb :index
  end 

  run if app_file == $0

end