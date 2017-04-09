class Chitter < Sinatra::Base

  get '/sessions/sign_in' do
    erb :'sessions/sign_in'
  end

  post '/sessions/sign_in' do
    if Maker.authentic?(params[:username], params[:password])
      maker = Maker.first(:username => params[:username])
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = 'wrong username or password'
      redirect '/sessions/sign_in'
    end
  end

  post '/sessions/sign_out' do
    session[:maker_id] = nil
    redirect '/peeps'
  end


end
