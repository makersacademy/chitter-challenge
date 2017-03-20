class Chitter < Sinatra::Base

  get '/peep/new' do
    if session[:user_id] == nil
      flash.next[:error_3] = "Please Log in First"
      redirect '/session/new'
    else
      erb :'./peep/new'
      end
  end

  post '/peep' do
    @peeps = Peep.create(peep: params[:peep], user_name: session[:user_name])
    redirect '/'
  end

  get '/peep/oldest_first' do
    @peeps = Peep.all
    erb :'./peep/board'
  end

end
