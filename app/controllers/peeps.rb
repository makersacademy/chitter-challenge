 class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
   user = User.get(session[:user_id])
    user.peeps.create(message: params[:message])
    redirect '/peeps'
  end
end