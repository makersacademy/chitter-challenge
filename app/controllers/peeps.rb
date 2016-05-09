class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'peeps/new'
    else
      flash.keep[:notice]='Please log in to post a peep'
      redirect '/sessions/new'
    end
  end

  post '/peeps' do
    new_peep = Peep.create(user: current_user, input: params[:peep])

    if new_peep.valid?
      flash.keep[:notice] = 'Congratulations! Your peep has been posted.'
      redirect '/peeps'
    else
      flash[:errors] = new_peep.errors.full_messages
      erb :'peeps/new'
    end


  end


end
