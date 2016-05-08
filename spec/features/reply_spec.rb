feature 'Reply' do

  xscenario 'user should be able to reply to a cheep' do
    sign_in_and_post(message: 'i love mushrooms')
    within "div#messages"
    click_button 'Reply'

  end

  scenario 'button should not be present if user not logged in' do
    visit '/posts/view'
    expect(page).not_to have_button 'Reply'
  end

end