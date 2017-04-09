class Ricker < Sinatra::Base

  get '/rolls/new' do
    erb :'rolls/new'
  end

  post '/rolls' do
    text = params[:new_roll]
    id = session[:user_id]
    Roll.create(text: text, user_id: id)
    redirect '/rolls/index'
  end

  get '/rolls/index' do

    @rolls = Roll.all
    erb :'rolls/index'
  end

end
