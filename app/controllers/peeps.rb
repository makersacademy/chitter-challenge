class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get 'peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message])
    if peep.save
      flash[:notice] = 'Peep Saved!'
      redirect '/peeps'
    else
      flash[:error] = peep.errors.full_messages
      redirect '/peeps'
    end
  end

  delete '/peeps' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/users/new'
  end
end
