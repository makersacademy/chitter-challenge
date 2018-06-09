require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/film'

class FaldoMovieRatings < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    @films = Film.all
    erb :index
  end

  get "/addfilm" do
    erb :addfilm
  end

  post "/addfilm" do
    valid_film = Film.create(title: params[:title],
      rating: params[:rating]
    )
    # valid_title = Film.create(title: params[:title])
    flash[:notice] = "You must fill in all fields" unless valid_film
    redirect("/")
  end

  run! if app_file == $0
end
