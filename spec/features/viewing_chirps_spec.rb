require './app/models/peep.rb'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the chitter page' do
    Peep.create(message: 'Welcome to Chitter!')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Welcome to Chitter!')
    end
  end
end
