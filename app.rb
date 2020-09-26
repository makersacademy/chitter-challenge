require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  
  run! if app_file == $0

  get '/' do
   erb :index
  end

  post '/add' do
    Peep.create(text: params[:text]) unless params[:text].empty?
    redirect '/'
  end

end