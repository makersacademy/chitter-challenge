class ChitterApp < Sinatra::Base

  helpers do
    def recent_peeps
      @recent_peeps ||= Peep.last(Peep::MAX_PEEP_PER_PAGE)
    end
  end

end
