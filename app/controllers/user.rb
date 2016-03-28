class Chitter < Sinatra::Base

  get '/maker/new' do
    erb :'/maker/new'
  end

  post '/register' do
    @maker = Maker.create(name: params[:name],
                      username: params[:username],
                         email: params[:email],
                      password: params[:password],
         password_confirmation: params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect '/peeps/read'
    else
      flash.now[:error] = @maker.errors.full_messages
      erb :'maker/new'
    end
  end

end
