require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/postapeep' do
    erb(:postapeep)
  end

  post '/peeps' do
    @user_peep = params[:user_peep]
    erb(:peeps)
  end

  run! if app_file == $0
end
