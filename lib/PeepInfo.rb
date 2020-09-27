

class PeepInfo

attr_reader :username, :content, :datetime

    def initialize(username, content, datetime)
        @username = username
        @content = content
        @datetime = datetime
    end
end