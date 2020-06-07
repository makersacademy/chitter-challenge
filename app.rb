require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index

  end

  post '/peeps' do
    txt = params[:peep]
    @peep = Message.new('Victor', txt, '2020-06-07 21:54:00')
    erb :peeps
  end
  run! if app_file == $0
end