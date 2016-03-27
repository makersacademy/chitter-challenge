class Chitter < Sinatra::Base
  delete '/sessions' do
    session.clear
    flash.keep[:notice] = 'Goodbye!'
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], time: Time.now)
    current_user = User.get(session[:user_id])
    current_user.peeps << peep
    current_user.save
    peep.save
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
