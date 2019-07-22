require 'sinatra/base'
require './lib/cheets.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get ('/') do
    @cheets = Cheets.all
    erb :index
  end

  get ('/newpost') do
  end

  post ('/newpost') do
    Cheets.create(message: params[:message])
    redirect ('/')
  end


  run! if app_file == $0
end
