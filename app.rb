require 'sinatra'

class Chitter < Sinatra::Base


  get '/homepage' do
    erb(:homepage)
  end

  post '/homepage/add' do

    redirect '/homepage'
  end

  run! if app_file == $0
end
