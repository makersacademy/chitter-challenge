class ChitterApp < Sinatra::Base

  helpers do
    def recent_peeps
      @recent_peeps ||= Peep.last(10)
    end
  end

end
