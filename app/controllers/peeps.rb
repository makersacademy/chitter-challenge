class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(body: params[:peep], time: Time.now,
      user_id: session[:user_id])
      redirect '/peeps'
    else
      flash.keep[:notice] = 'You must be signed in to peep'
      redirect '/users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'peeps/index'
  end

end
