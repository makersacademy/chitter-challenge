require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/messages'
  end

  get '/sign_up' do
    erb(:'links/sign_up')
  end

  post '/sign_up' do
    p params
    session[:user] = params[:email]
    redirect '/messages'
  end

  get '/messages' do
    @current_user = session[:user]
    erb(:'links/messages')
  end

  get '/peep' do
    erb(:'links/peep')
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
