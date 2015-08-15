require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.new(text: 'This is a new peep')
    visit '/peeps'
    # as this is our first feature test,
    # the following expectation is a quick check that everything is working.
    expect(page.status_code).to eq 200
    # you might remove this later.
    # why do we use within here?
    # might we get a false positive if we just test for 'Makers Academy'?
    within 'ul#peeps' do
      expect(page).to have_content('This is a new peep')
    end
  end
end