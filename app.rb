require 'sinatra/base'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect 'tweets'
  end

  get '/tweets' do
    @tweets = Chitter.show
  #{params[:tweet]}
    erb :index
  end

 post '/tweets' do
 tweet = params[:tweet]
  #redirect 'tweets'
"Hello? #{tweet}"
end



  run! if app_file == $0
end