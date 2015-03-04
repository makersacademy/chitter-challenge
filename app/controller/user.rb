class Chitter < Sinatra::Base

  get('/users/new') do
    @user = User.new
    erb :"users/new"
  end

  post('/users') do
    @user = User.create(:name => params[:name],
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation],
                        :username => params[:username],
                        :email => params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end
end