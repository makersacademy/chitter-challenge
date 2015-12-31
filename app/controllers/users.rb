class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/sign_in'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/links')
      else
        flash.now[:errors] = @user.errors
        erb :'users/sign_in'
      end
  end


end
