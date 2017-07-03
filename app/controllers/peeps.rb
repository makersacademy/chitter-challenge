
class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(message: params[:peep], user_id: session[:user_id])
      redirect '/peeps'
    else
      flash.now[:errors] = ['You must be signed in to post a peep']
      erb :'peeps/new'
    end
  end

end
