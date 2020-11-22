require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
    get('/') do
        'Chitter'
    end

    get('/peeps') do
        @peeps = Peep.all
        erb(:'peeps/index')
    end

    get('/peeps/new') do
        erb(:'peeps/new')
    end

    post('/peeps') do
        Peep.create(content: params[:content])
        redirect('/peeps')
    end

    run! if app_file == $0
end