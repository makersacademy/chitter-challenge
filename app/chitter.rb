require 'sinatra/base'


class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @new_peep = false
    @posts = session[:message]
    erb :index
  end

  get '/compose_peep' do
    @new_peep = true
    erb :index
  end

  post '/update_peeps' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0
end
