require 'sinatra/base'
require_relative './models/data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :sign_up
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    @user = User.create(name: params[:name], username: params[:username],
                e_mail: params[:e_mail], password: params[:password])
    @new_peep = params[:new_peep]
    erb :peep
  end

  run! if app_file == $0

end
