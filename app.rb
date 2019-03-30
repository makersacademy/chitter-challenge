require 'sinatra/base'

class Peeps < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end
  
  get '/login' do
    erb(:login_get)
  end

  post '/peep' do
    @user = params[:name]
    session['name'] = @user
    erb(:peep_post)
  end

  run! if app_file == $0
end
