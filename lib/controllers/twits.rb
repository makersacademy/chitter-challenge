class Tweeter < Sinatra::Base

  get '/' do
    erb :'twit/index'
  end

  get '/twit/new' do
    erb :'twit/new'
  end

  post '/twit' do
    twit = Twit.create(content: params[:content],
    user: current_user,
    time_stamp: Time.new.strftime("%Y-%m-%d %H:%M:%S"))
    redirect '/'
  end
end
