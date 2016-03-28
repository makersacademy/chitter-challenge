class Chitter < Sinatra::Base
  delete '/sessions' do
    session.clear
    flash.keep[:notice] = 'Goodbye!'
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all(order: :time.desc)
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], time: Time.now)
    if current_user
      current_user.peeps << peep
      peep.save
      redirect '/peeps'
    else
      flash.now[:errors] = ['You must be logged in to peep!']
      erb :'/sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
