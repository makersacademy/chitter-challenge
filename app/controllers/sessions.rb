class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    maker = Maker.authenticate(params[:email], params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect to('/makers')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:maker_id] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to '/'
  end
end
