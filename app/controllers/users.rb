class Chitter < Sinatra::Base
  get '/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/sign_up' do
    @user = User.create(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash[:notice] = @user.errors.full_messages.join('. ')
      redirect '/sign_up'
    end
  end
end
