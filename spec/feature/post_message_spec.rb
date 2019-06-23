RSpec.feature 'Chitter' do

  scenario 'user post a message' do
    visit '/chitter'
    fill_in 'peep', with: 'First peep!'
    click_button 'submit'

    expect(page).to have_content('First peep!')
  end

  scenario 'the messages are shown on a reverse order' do
    
    visit '/chitter'
    fill_in 'peep', with: '1st message'
    click_button 'submit'

    fill_in 'peep', with: '2nd message'
    click_button 'submit'

    expect(page).to have_content("Chitter\n2nd message")
  end
end
