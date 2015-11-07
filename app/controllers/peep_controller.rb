require_relative 'base_controller'

module Routes

  class PeepController < BaseController

    get '/' do

    end
    

    run! if app_file == $PROGRAM_NAME
  end

end
