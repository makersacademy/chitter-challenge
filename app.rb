require 'sinatra'

class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    @new_peep = params[:new_peep]
    erb :peeps
  end

  run! if app_file == $0
end
