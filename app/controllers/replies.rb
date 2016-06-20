class Chitter < Sinatra::Base

  get '/replies/new' do
    @peep = Peep.get(params[:peep_id])
    erb :'replies/new'
  end

  post '/replies' do
    reply = Reply.new(content: params[:reply])
    peep = Peep.get(params[:peep_id])
    reply.peep_id = peep.id
    reply.user_id = current_user.id
    reply.save
    redirect "/peeps/#{peep.user.username}"
  end



end
