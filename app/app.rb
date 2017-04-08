require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :'/index'
  end

  get '/user/new' do
    erb :'/user/new'
  end 



end
