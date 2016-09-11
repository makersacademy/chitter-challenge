require 'spec_helper.rb'

feature 'Viewing peeps' do

  scenario 'I can see peeps on the homepage' do
    Peep.create(message: 'What a lovely day')
    Peep.create(message: 'I love coding when its sunny outside')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('What a lovely day')
    end
  end
end
