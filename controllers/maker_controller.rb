class MakerController
    get '/' do
        redirect to '/createaccount'
    end

    get '/createaccount' do
        @maker = Maker.new
        erb :'maker/createaccount'
    end

    post '/createaccount-details' do
        @maker = Maker.new(name: params[:name],
                            email: params[:email],
                            username: params[:username],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation])
        if @maker.save
            session[:maker_id] = @maker.id
            redirect to '/homepage'
        else
            flash.now[:errors] = @maker.errors.full_peeps
            erb :'maker/createaccount'
        end
    end

    get '/signin' do
        erb: 'maker/signin'
    end

    post '/signin-details' do
        @maker = Maker.authenticate(params[:username], params[:password])
        if @maker
            session[:maker_id] = @maker.id
            redirect to '/homepage'
        else
            flash.now[:signin_error] = 'The username and/or password is not recognised'
            erb :'maker/signin'
        end
    end

    delete '/sessions' do
        session[:maker_id] = nil
        redirect to '/signin'
    end

    run! if app_file == $PROGRAM_NAME
    end
end





end   