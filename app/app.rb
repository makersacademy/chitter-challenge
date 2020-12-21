require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Howdy'
    erb :index
  end


  get '/postboard' do

  erb :postboard
  end

  post '/chitter_post' do
    @user_1_post = params[:user_1_post]
  erb :postboard
end

  run! if app_file == $0
end
