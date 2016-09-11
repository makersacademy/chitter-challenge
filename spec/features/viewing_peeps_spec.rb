require 'spec_helper.rb'

feature 'Viewing peeps' do

  scenario 'I can see peeps on the homepage' do
    peep
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Walter is a girl')
    end
  end
end
