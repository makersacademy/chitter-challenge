class Chitter < Sinatra::Base

  get '/tweets/new' do
    @user = current_user
    erb :'tweets/new'
  end

  post '/tweets' do
      Tweet.create(text: params[:Tweet],
                  time: Time.now,
                  username: current_user.username)
      @user = current_user
      @tweets = Tweet.all(order: [:time.desc])
      erb :'tweets/index'
  end
end
