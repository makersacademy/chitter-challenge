RSpec.feature 'Chitter' do

  scenario 'user post a message' do
    visit '/chitter'
    fill_in 'peep', with: 'First peep!'
    click_button 'submit'

    expect(page).to have_content('First peep!')
  end
end
