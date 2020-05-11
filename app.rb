require 'sinatra'
require './lib/diary'
require './lib/user'

class DailyDiary < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end
  get '/diary' do
    @user = User.find(id: session[:user_id])
    @diaries = Diary.all
    erb :'diary/index'
  end

  post '/diary' do
    Diary.add(title:params['title'], body: params['msg'])
    redirect '/diary'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/diary'
  end
end