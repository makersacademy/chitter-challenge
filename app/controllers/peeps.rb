class Chitter < Sinatra::Base
  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(user_id: session[:user_id],
      message: params[:message])
      peep.save
      redirect '/peeps'
    else
      flash.next[:error] = 'Must sign in first'
      redirect 'peeps/new'
    end
  end
end
