require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/post' do
    params[:content]
  end

  run! if app_file == $0
end
