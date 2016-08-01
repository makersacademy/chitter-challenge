class Chitter < Sinatra::Base

  post '/reply' do
    peep = Peep.get(params[:peep_id])
    user = User.get(session[:user_id])
    reply = Reply.create(content: params[:content],
                        owner: user.handle,
                        created: Time.new,
                        peep_id: params[:peep_id])
    peep.replys << reply
    peep.save
    redirect '/peeps'
  end

end
