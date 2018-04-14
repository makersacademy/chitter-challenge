require 'sinatra/base'
require './lib/peeps'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions


  get '/viewpeeps' do

  end

  get '/chitter' do
    erb :signin

  end


end
