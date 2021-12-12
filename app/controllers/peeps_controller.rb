class PeepsController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @chitters = Peep.all
    erb(:index)
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/'
  end
end