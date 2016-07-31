class Chitter < Sinatra::Base

  post '/reply' do
    peep = Peep.get(params[:peep_id])
    reply = Reply.create(content: params[:content],
                        owner: peep.author,
                        created: Time.new,
                        peep_id: params[:peep_id])
    peep.replys << reply
    peep.save
    redirect '/peeps'
  end

end
