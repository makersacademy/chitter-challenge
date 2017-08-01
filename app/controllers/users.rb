require 'sinatra/base'
require 'sinatra/flash'
require_relative '../models/peep'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/reply'

class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if create_user(params)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Invalid login"
      erb :'users/new'
    end
  end

  get '/users/profile' do
    erb :'users/profile'
  end

end
