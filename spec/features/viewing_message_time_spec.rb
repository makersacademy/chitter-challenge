describe 'users can see the time message was posted', type: :feature do
  scenario 'A user posts a message' do
    allow(Time).to receive(:now) { '2018-04-14 10:05:57 +0000' }
    visit '/'
    click_button 'view messages'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name' ,with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'password', with: 'trex89D!'
    fill_in 'password1', with: 'trex89D!'
    click_button 'submit'
    click_button 'write message'
    fill_in 'content', with: 'Good morning!'
    click_button 'send message'
    expect(page).to have_content '2018-04-14 10:05:57'
  end
end
