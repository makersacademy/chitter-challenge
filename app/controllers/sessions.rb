class Chitter < Sinatra::Base

  get '/' do
    redirect '/sessions/sign_in'
  end

  get '/sessions/sign_in' do
    erb :'sessions/sign_in', :layout => :heading
  end

  post '/sessions/sign_in' do
    if Maker.authentic?(params[:username], params[:password])
      maker = Maker.first(username: params[:username])
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = 'wrong username or password'
      redirect '/sessions/sign_in'
    end
  end

  post '/sessions/sign_out' do
    session[:maker_id] = nil
    redirect '/sessions/sign_in'
  end

end
