require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/film'
require 'uri'

class FaldoMovieRatings < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @films = Film.all(params[:sort_order])
    erb :index
  end

  get "/addfilm" do
    erb :addfilm
  end

  post "/addfilm" do
    valid_film = Film.create(title: params[:title],
      rating: params[:rating]
    )
    flash[:notice] = "You must enter all fields to submit" unless valid_film
    if valid_film
      redirect("/")
    else
      redirect("/addfilm")
    end
  end

  run! if app_file == $0
end
