require_relative 'web_helper'

feature 'When reading the peepline' do
  scenario 'I can see them in reverse chronological order' do
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    default_peepline
    visit '/peeps'

  end
end
