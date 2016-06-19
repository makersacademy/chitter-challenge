require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(body: 'peeping is cool', title: 'my first peep')

    visit '/peeps'

    expect(page.status_code).to eq 200
    
    within 'ul#peeps' do
      expect(page).to have_content('my first peep')
    end
  end
end