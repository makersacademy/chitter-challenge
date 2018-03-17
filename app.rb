require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @message = session[:message]
    erb(:index)
  end

  post '/new_message' do
    session[:message] = params[:message]
    redirect('/')
  end

  run! if app_file == $0
end
