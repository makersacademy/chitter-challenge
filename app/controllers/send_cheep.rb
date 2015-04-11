class Chitter < Sinatra::Base
  post '/cheeps/new' do
    cheep = params[:cheep]
    @user = User.first(id: session[:user_id])
    Cheep.create(message: cheep, user: @user)
    erb :index
  end
end
