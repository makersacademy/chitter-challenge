require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/sign-up' do
    User.create(params[:username], params[:email], params[:password])
  end

  post '/peeps' do
    redirect '/'
  end

  run! if app_file == $0

end
