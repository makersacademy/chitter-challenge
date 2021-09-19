class PeepController < BaseController
    get '/homepage' do
        @peeps = Peep.all
        erb :'maker/homepage'
    end

    post '/new-peep' do
        peep = Peep.new(peep: params[:message], time: Time.now)
        peep.maker = current_maker
        peep.save!
        redirect '/homepage'
    end

    run! if app_file == $PROGRAM_NAME
    end
end