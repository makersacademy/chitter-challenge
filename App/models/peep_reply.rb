# frozen_string_literal: true

class PeepReply < ActiveRecord::Base
  attr_accessor :id, :content, :reply_date
end
