require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index

  end

  post '/peeps' do
    txt = params[:peep]
    @peep = Message.new(txt)
    p @peep.body
    erb :peeps
  end
  run! if app_file == $0
end