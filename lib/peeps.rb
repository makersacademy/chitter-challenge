require_relative '../database_connection_setup'
require 'action_view'
require 'active_support'

class Peeps < ActiveRecord::Base
  extend ActionView::Helpers::DateHelper

  def self.post(new_message)
    create(message: new_message)
  end

  def self.list
    all.order(created_at: :desc)

  end

  def self.format_time(time_string)
    time = Time.now.strftime("%d/%m/%Y at %k:%M")
    time_ago = time_ago_in_words(time_string)

    "#{time_ago} ago(#{time})"
  end
end
