require 'sinatra/base'
require_relative './lib/chitter'

class ChitterMessenger < Sinatra::Base

  get '/peeps' do
    @messages = Chitter.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
