class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      error_string = ''
      @user.errors.each_value do |error|
        error_string << "#{error.first} "
      end
      flash.now[:notice] = error_string
      erb :'users/new'
    end
  end

end