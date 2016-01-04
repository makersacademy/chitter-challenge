class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.sort_by(&:created_at).reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(user: current_user, content: params[:content])
    if peep.save
      redirect '/peeps'
    else
      flash.now[:errors] = peep.errors.full_messages
      erb :'/peeps/new'
    end
  end

  get '/peeps/:peep_id' do
    @peep_id = params[:peep_id]
    erb :'/peeps/reply'
  end

  post '/peeps/reply' do
    reply = Reply.new(user: current_user, 
                      peep: Peep.first(id: params[:peep_id]),
                      content: params[:content])
    if reply.save
      redirect '/peeps'
    else
      flash.now[:errors] = reply.errors.full_messages
      erb :'/peeps/reply'
    end
  end
end
