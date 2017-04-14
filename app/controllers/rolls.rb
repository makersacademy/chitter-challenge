class Ricker < Sinatra::Base

  get '/rolls/new' do
    erb :'rolls/new'
  end

  post '/rolls' do
    text = params[:new_roll]
    id = session[:user_id]
    time = Time.now
    Roll.create(text: text, user_id: id, time: time)
    redirect '/rolls/index'
  end

  get '/rolls/index' do
    @rolls = Roll.all.sort_by {|roll| roll.time}.reverse!
    erb :'rolls/index'
  end

end
