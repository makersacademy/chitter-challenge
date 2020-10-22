require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    @new_peep = params[:post]
    erb :chitter
  end

    run! if app_file == $0
end