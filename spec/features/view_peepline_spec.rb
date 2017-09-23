require_relative 'web_helper'

feature 'When reading the peepline' do

  let(:peep1) { 'And those who are first will be last'}
  let(:peep2) {'So those who are last now will be first'}

  scenario 'I can see them in reverse chronological order' do
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    default_peepline
    visit '/peeps'
    expect(peep2).to appear_before(peep1)
  end

  scenario 'I can see them with time stamps' do
    # As a Maker
    # So that I can better appreciate the context of a peep
    # I want to see the time at which it was made
    new_time = Time.new(2017, 9, 22, 9, 0, 0)
    Timecop.freeze(new_time) do
      default_peepline
      visit '/peeps'
      expect(find_by_id('peeps_list')).to have_content(peep2 + " on 2017-09-22 at 09:00")
    end
  end

end
