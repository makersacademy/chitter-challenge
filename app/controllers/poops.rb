class Chitter < Sinatra::Base


  get '/' do
    erb :home
  end


  get '/poops/new' do
    if session[:user_id]
      erb :'/poops/new'
    else
      redirect '/'
    end
  end

  post '/poops' do
    poop = current_user.poops.create(
      poop_msg: params[:poop_msg]
    )
   redirect '/'
  end

end
