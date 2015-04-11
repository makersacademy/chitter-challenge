class Chitter < Sinatra::Base
  post '/cheeps/new' do
    cheep = params[:cheep]
    Cheep.create(message: cheep)
    @user = User.first(id: session[:user_id])
    erb :index
  end
end
