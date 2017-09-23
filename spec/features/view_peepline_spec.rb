require_relative 'web_helper'

feature 'When reading the peepline' do
  scenario 'I can see them in reverse chronological order' do

    peep1 = 'And those who are first will be last'
    peep2 = 'So those who are last now will be first'
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    default_peepline
    visit '/peeps'
    expect(peep2).to appear_before(peep1)

  end
end
