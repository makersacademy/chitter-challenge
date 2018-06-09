require 'sinatra/base'
require 'pg'
require './lib/film'

class FaldoMovieRatings < Sinatra::Base
  get '/' do
    @films = Film.all
    erb :index
  end

  get "/addfilm" do
    erb :addfilm
  end

  post "/addfilm" do
    Film.create(title: params[:title],
      rating: params[:rating]
    )
    redirect("/")
  end

  run! if app_file == $0
end
