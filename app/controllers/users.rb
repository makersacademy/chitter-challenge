class NomDiaries < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                        nom_name: params[:nom_name],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect to('/noms')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
  
end
