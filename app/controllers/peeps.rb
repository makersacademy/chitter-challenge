class App < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = current_user(session[:user_id])
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :'peeps/index'
  end

  get '/peeps/add' do
    if @user = current_user(session[:user_id])
      erb :'peeps/add'
    else
      redirect '/register'
    end
  end

  post '/peeps/add' do
    @peep = Peep.new(content: params[:content], created_at: Time.now, user_id: session[:user_id])
    if @peep.save
      flash[:message] = :peep_added
      redirect '/peeps'
    else
      flash[:content] = params[:content]
      flash[:message] = :add_peep_error
      redirect '/peeps/add'
    end
  end

  get '/:username' do
    @user = User.first(:username => params[:username])
    erb :'peeps/index'
  end
end
