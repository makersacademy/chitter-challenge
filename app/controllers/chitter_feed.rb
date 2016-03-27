class Chitter < Sinatra::Base
  get '/chitter_feed' do
    @peeps = Peep.all
    erb :'chitter_feed/chitter_feed'
  end

  get '/chitter_feed/new' do
    erb :'chitter_feed/new_peep'
  end

  post '/chitter_feed/new' do
    peep = Peep.new(message: params[:message], time: Time.now)
    if current_user
      current_user.peeps << peep
      peep.save
      redirect to '/chitter_feed'
    else
      flash.now[:error] = ["Log in to peep!"]
      erb :'log_in/log_in'
    end
  end

  delete '/sessions' do
    flash.keep[:notice] = "Goodbye!"
    session[:user_id] = nil
    redirect to '/'
  end

  post '/chitter_feed/like' do
    peep = Peep.get(params[:like])
    like = Like.new
    peep.likes << like
    like.save
    redirect to '/chitter_feed'
  end
end
