require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    'Hey chitter!'
  end

    run! if app_file == $0
end