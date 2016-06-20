class Chitter < Sinatra::Base

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/'
    end
  end

  post '/peeps' do
    peep = Peep.new(content: params[:peep])
    peep.user = current_user

    if peep.save
      redirect "/peeps/#{current_user.username}"
    end

    redirect "/peeps/new"
  end

  get '/peeps/:username' do
    @user = User.first(username: params[:username])

    if @user
      @peeps = @user.peeps(:order => [:created_at.desc])
      erb :'peeps/list'
    else
      erb :'users/no_user'
    end
  end
end
