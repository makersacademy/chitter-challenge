# frozen_string_literal: true

class Peep < ActiveRecord::Base
  attr_accessor :id, :content, :user_id, :peep_reply_id, :peep_tags_id, :post_timestamp

end
