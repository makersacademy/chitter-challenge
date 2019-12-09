require 'sinatra'
require './lib/peep_class'

class Chitter < Sinatra::Base


  get '/homepage' do
    @all_post = Peep.sort_by
    erb(:homepage)
  end

  post '/homepage/add' do
    Peep.post(message: params[:what])
    redirect '/homepage'
  end

  run! if app_file == $0
end
