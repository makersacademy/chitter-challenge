require 'sinatra/base'

class FaldoMovieRatings < Sinatra::Base
  get '/' do
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
