feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'Setting up Chitter. This is my first peep.')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Setting up Chitter. This is my first peep.')
    end
  end
end
