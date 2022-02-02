class PeepsController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @user_name = User.find(id: chitter.user_id).username
    @chitters = Peep.all
    erb(:index)
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/'
  end
end
