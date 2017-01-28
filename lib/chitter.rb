require 'sinatra/base'

class Chitter < Sinatra::Base
  # set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    erb :'feed/index'
  end
end
