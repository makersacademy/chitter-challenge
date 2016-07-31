class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get 'peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    peep = Peep.new(user: user, message: params[:message])
    peep.user_id = current_user.id
    if peep.save
      flash[:notice] = 'Peep Saved!'
    else
      flash[:error] = peep.errors.full_messages
    end
      redirect '/peeps'
  end

  delete '/peeps' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/users/new'
  end
end
