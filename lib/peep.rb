class Peep
    attr_accessor :id, :message, :time_stamp, :user_id

    def initialize
        @time_stamp = Time.new.strftime("%Y/%m/%d %k:%M:%S")
    end

end