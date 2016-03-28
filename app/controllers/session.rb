class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'/session/new'
  end

  post '/session' do
    maker = Maker.authenticate(params[:username],
                               params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect '/peeps/read'
    else
      flash.now[:error] = ['Email & Password combo is wrong!']
      erb :'/session/new'
    end
  end
  
  delete '/session' do
    session[:maker_id] = nil
    flash.keep[:message] = 'Bye!'
    redirect '/'
  end

end
