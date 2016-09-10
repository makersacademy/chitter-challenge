require 'spec_helper'

feature 'view peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(name: 'chitter username', msg: 'my first peep')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('my first peep')
    end
  end
end
