class Chitter < Sinatra::Base

  post '/peep' do
    peep = Peep.create(message: Sanitize.fragment(params[:new_peep]),
                       username: current_user.username,
                       name: current_user.name)
    redirect '/'
  end

  post '/reply' do
    reply = Reply.create(message: Sanitize.fragment(params[:reply]),
                         username: current_user.username,
                         name: current_user.name,
                         peep: Peep.first(id: params[:peep_id]))
    Peep.first(id: params[:peep_id]).replies << reply
    redirect '/'
  end

end
