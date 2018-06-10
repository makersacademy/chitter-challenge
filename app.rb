require './lib/comment'
require './lib/film'
require './lib/user'
require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require 'uri'

class FaldoMovieRatings < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @films = Film.all(params[:sort_by])
    @comments = Comment.all
    erb :index
  end

  get "/addfilm" do
    erb :addfilm
  end

  post "/addfilm" do
    valid_film = Film.create(title: params[:title],
      rating: params[:rating])
    unless valid_film
      flash[:notice] = "You must enter all fields to submit"
      redirect("/addfilm")
    end
    redirect("/")
  end

  get "/comment/:title" do
    @film_to_comment_on = params[:title]
    erb :comment
  end

  post "/comment/:title" do
    Comment.add(title: params[:title], comment: params[:comment])
    redirect("/")
  end

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect("/")
  end

  run! if app_file == $0
end
