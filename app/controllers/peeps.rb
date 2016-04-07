class Chitter < Sinatra::Base

  get '/peeps' do
    @list = Peep.all(order: [ :created_at.desc ])
    @user = current_user
    erb :index
  end

  get '/peeps/new' do
    if current_user
      @peep = current_user.peeps.new
      erb :'peeps/new'
    else
      flash.next[:errors] = 'Sign in to peep'
      redirect 'sessions/new'
    end
  end

  post '/peeps' do
    if current_user
      @peep = current_user.peeps.new(body: params[:peep])
      if @peep.save
        redirect '/peeps'
      else
        flash.now[:errors] = @peep.errors.full_messages
        erb :'peeps/new'
      end
    else
      flash.next[:errors] = 'Sign in to peep'
      redirect 'sessions/new'
    end
  end

end
