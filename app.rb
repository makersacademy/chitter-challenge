require 'pg'
require 'sinatra/base'
require './lib/film'

class FaldoMovieRatings < Sinatra::Base

  # register Sinatra::Flash

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
    # valid_title = Film.create(title: params[:title])
    # flash[:notice] = "Title must be under 60 chars" unless valid_title
    redirect("/")
  end

  run! if app_file == $0
end
