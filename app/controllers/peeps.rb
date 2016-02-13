class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      flash[:notice] = 'You must be signed in to peep!'
      redirect '/'
    end
  end

  post '/peeps' do
    current_user.peeps.create(peeps: params[:peep], time: Time.now)
    redirect '/'
  end


end
