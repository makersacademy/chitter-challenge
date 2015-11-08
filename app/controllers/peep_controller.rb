require_relative 'base_controller'

 module Routes

   class PeepController < BaseController

     get '/home' do
       @peeps = Peep.all
       erb :'maker/home'
     end

    post '/new-peep' do
      @peep = Peep.create(peep: params[:message], time: Time.now)
      session[:peep_id] = @peep.id
      current_maker.peeps << @peep
      current_maker.save
      redirect '/home'
    end

    run! if app_file == $PROGRAM_NAME
  end

end
