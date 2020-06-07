require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index

  end

  post '/peeps' do
    @peep = Message.new(params[:peep])
    erb :peeps
  end
  run! if app_file == $0
end