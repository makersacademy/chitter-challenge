require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = params[:post]
    erb :chitter
  end

    run! if app_file == $0
end