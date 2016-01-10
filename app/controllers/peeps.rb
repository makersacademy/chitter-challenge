class Chitter < Sinatra::Base
register Sinatra::MultiRoute
  get '/', '/peeps' do
    @messages = Message.all
    erb :'peeps'
  end

  # get '/peeps' do
  #   @messages = Message.all
  #   erb :'peeps'
  # end

  post '/peeps' do
    if session[:user_id]
      message = Message.create(message: params[:message],
                               user_id: current_user.id,
                               time: Time.now)
    else
      flash[:logged_out] = 'Oops! You need to be logged in to peep.'
    end
    redirect '/peeps'
  end

  get '/reply' do
    @username = params[:username]
    erb :'reply'
  end

end
