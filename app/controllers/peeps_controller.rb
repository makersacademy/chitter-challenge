class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.order(created_at: :desc)
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    erb :index
  end

  post '/peeps' do
    @peep = Peep.create(
      message: params[:message],
      user_id: session[:user_id]
    )
    redirect '/'
  end

end
