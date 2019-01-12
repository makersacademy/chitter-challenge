require_relative 'web_helpers'
require 'rails_helper'

RSpec.feature 'Peeps' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  context 'Creating' do

    before do
      Timecop.freeze(Time.local(2018, 12, 17, 05, 10, 0))
    end

    after do
      Timecop.return
    end

    scenario 'A Maker can post a peep and see its content + timestamp' do
      post_peep
      expect(page).to have_content 'First peep'
      expect(page).to have_content 'I love summer!'
      expect(page).to have_content 'Created at 05:10AM on 17/12/2018'
    end
  end

end
