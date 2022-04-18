feature 'posting a peer' do
  scenario 'a user can post a peep to chitter' do
    visit('/chitter/peeps/new')
    fill_in 'peeps', with: 'Welcome to chitter'
    expect(page).to have_button 'Submit'
  end
end
