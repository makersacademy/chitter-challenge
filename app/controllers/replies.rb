class Chitter < Sinatra::Base
  get '/:id/reply' do
    @peep = Peep.get(params[:id])
    erb :'reply/new'
  end

  post '/:id/reply/new' do
   reply =  Reply.new(body: params[:reply], time: Time.now, user: current_user)
   peep = Peep.get(params[:id])
   peep.replies << reply
   peep.save 
   redirect '/home'
  end
end
