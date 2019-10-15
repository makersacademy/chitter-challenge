class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.reverse_order
    erb :'peeps/peeps'
  end

  post '/peeps' do
    if current_user
    Peep.create(message: params[:text], user_id: current_user.id)
    flash[:success] = 'Peep added to Chitter'
    redirect '/'
    else
      flash[:alert] = 'You must have an account to post to Chitter'
      redirect '/'
    end
  end

end
