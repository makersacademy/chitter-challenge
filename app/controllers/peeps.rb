class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    @users = User.all
    erb :index
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/peeps'
  end
end
