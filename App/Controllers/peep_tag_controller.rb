# frozen_string_literal: true

class PeepTagController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  path = '/peeps'

  get("#{path}/:id") do

  end

  get("#{path}/:page") do

  end

  post("#{path}") do
    # (user_id,content,post_timestamp)
    # TODO save in database
    # TODO give confirmation
  end

  get("#{path}/tags") do

    # TODO save in database
    # TODO give confirmation
  end

  post("#{path}/tags") do

    # TODO save in database
    # TODO give confirmation
  end

  post("#{path}/reply") do

    # TODO save in database
    # TODO give confirmation
  end

end

