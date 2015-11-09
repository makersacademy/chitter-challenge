require_relative 'base_controller'

module Routes

   class PeepController < BaseController

     get '/home' do
       @peeps = Peep.all
       erb :'maker/home'
     end

     post '/new-peep' do
       peep = Peep.new(peep: params[:message], time: Time.now)
       peep.maker = current_maker
       peep.save!
       redirect '/home'
     end

     run! if app_file == $PROGRAM_NAME
   end

end
