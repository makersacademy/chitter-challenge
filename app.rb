require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    @peep = session[:peep]
    erb(:index)
  end

  post('/new') do
    session[:peep] = params[:peep]
    redirect('/')
  end


  run! if app_file == $0
end
