require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/peeps' do
    "My first Peep"
  end

  run! if app_file == $0

end
