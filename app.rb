require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/index' do
    session[:content] = params[:content]
    redirect '/post'
  end

  get '/post' do
    @content = session[:content]
   erb :post
  end

end
