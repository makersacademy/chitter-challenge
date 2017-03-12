require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :sign_up
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    @name = params[:name]
    @username = params[:username]
    @e_mail = params[:e_mail]
    @new_peep = params[:new_peep]
    erb :peep
  end

  run! if app_file == $0

end
