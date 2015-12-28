class Chitter < Sinatra::Base
  get '/peeps/new' do
    if current_user
      @peep = current_user.peeps.new
      erb :'peeps/new'
    else
      flash.next[:errors] = ['You have to sign in to peep']
      redirect 'sessions/new'
    end
  end

  post '/peeps' do
    if current_user
      @peep = current_user.peeps.new(content: params[:content])
      if @peep.save
        redirect '/peeps'
      else
        flash.now[:errors] = @peep.errors.full_messages
        erb :'peeps/new'
      end
    else
      flash.next[:errors] = ['You have to sign in to peep']
      redirect 'sessions/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'peeps/index'
  end
end
