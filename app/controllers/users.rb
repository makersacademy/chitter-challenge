class Chitter < Sinatra::Base
  
  get '/users/new' do
    erb :'users/new'
  end

  get '/users/account' do
    @user = User.get(session[:user_id])
    erb :'users/account'
  end

  post '/users' do
    @user = User.create(email: params[:email], 
                        username: params[:username], 
                        password: params[:password],
                        first_name: params[:first_name],
                        last_name: params[:last_name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :'users/new'
    end
  end

  put '/users' do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open(settings.public_folder + "/uploads/" + "#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    @user = User.get(session[:user_id]).update(first_name: params[:first_name],
                                   last_name: params[:last_name],
                                   avatar: @filename)

  end

end
