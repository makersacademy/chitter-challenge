require 'timecop'

feature 'See all Peeps' do 
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario '-User sees all Peeps in reverse chronological order' do
    Peeps.new('Oldest Message')
    Peeps.new('Newest Message')

    visit('/peeps')
    # The :nth-child(n) selector matches every element that is the nth child of its parent
    expect(page.find('li:nth-child(1)')).to have_content('Newest Message')
    expect(page).to have_content('Oldest Message')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario '-User sees time Peeps were made' do
    Peeps.new('Newest Message')
    visit('/peeps')

    page.find('#time_posted', :visible => true)
  end
end
