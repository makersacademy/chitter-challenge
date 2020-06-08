feature 'User can post a peep' do
  scenario 'user submits message to send' do
    visit '/login'
    fill_in 'peep', with: 'I am a life long learner'
    click_button 'send peep'

    expect(page).to have_content 'I am a life long learner'
  end
end
