require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
