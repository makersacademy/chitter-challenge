module ChitterApp
  module Models
    class Reply
      include DataMapper::Resource
      property :id, Serial
      property :reply_content, Text
      property :creation_time, DateTime
      belongs_to :user
      belongs_to :peep
    end
  end
end
