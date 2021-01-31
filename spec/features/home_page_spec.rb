# Homepage tests
feature 'Homepage' do
  scenario 'User visits the home page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'User posts a Peep' do
    visit('/')
    fill_in :peep, with: 'My first peep!'
    click_button('Peep')
    expect(page).to have_content('My first peep!')
  end
end
