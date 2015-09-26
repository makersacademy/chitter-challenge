require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'User does not have to be signed in' do
    Peep.create(content: 'First peep')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('First peep')
    end
  end

end
