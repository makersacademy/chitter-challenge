require 'sinatra'

class TwitTwoo < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/register' do
    owl = Owl.save(nam: params[:name], username: params[:username], password: params[:password], email: params[:email])
    
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end