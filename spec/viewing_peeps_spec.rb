require 'spec_helper'

feature 'Viewing peeps' do
  scenario 'user can see existing peeps on peeps page' do
    Peep.create(content: 'Nice weather')
    visit('/peeps')
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Nice weather')
    end
  end
end