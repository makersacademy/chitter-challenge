require 'sinatra/base'

require './app/models/user'

class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  # post '/users' do
  #   @user = User.create(email: params)
  #
  # end
end
