class Chitter < Sinatra::Base
  post '/cheeps/new' do
    cheep = params[:cheep]
    @user = User.first(id: session[:user_id])
    Cheep.create(message: cheep, user: @user, time_stamp: Time.now)
    erb :index
  end
end
