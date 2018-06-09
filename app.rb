require 'sinatra/base'

class FaldoMovieRatings < Sinatra::Base
  get '/' do
    erb :index
  end

  get "/addfilm" do
    erb :addfilm
  end

  run! if app_file == $0
end
