class Chitter < Sinatra::Base

  get '/' do
     redirect to('/home')
   end

   get '/home' do
    #  show_peeps = Peep.all(peep: params[:peep])
     @show_peeps = Peep.all(order: [ :id.desc ])
     erb(:home)
   end

   get '/sessions/new' do
     erb(:'/sessions/new')
   end

   post '/sessions' do
     user = User.authenticate(params[:username], params[:password])
     if user
       session[:user_id] = user.id
       redirect to('/home')
     else
       flash.now[:errors] = ['The username or password is incorrect']
       erb(:'sessions/new')
     end
   end

   delete '/sessions' do
     session[:user_id] = nil
     flash.keep[:notice] = 'Bye!'
     redirect to('/home')
   end

end
