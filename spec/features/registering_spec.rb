describe 'users can register to post', type: :feature do
  scenario 'a visitor visits messages page and registers to post' do
    visit '/messages'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'password', with: 'trex89D!'
    fill_in 'password1', with: 'trex89D!'
    click_button 'submit'
    expect(page).to have_button 'write message' 
  end

  scenario 'a visitor that has not registered or logged in views messages' do
    visit '/messages'
    expect(page).not_to have_content 'write message'
  end
end
