feature 'Replying to peep' do
  scenario 'User can reply to peep from another user' do
    user = create(:user)
    another_user = create(:another_user)
    peep = Peep.create(content: 'Learninig FactoryGirl')
    peep.user_id = another_user.id
    peep.save
    sign_in(user)
    visit "/users/#{another_user.id}/peeps"
    click_link 'Reply'
    fill_in 'reply', with: 'Me too'
    click_button 'Reply'
    expect(page).to have_content('Me too')
  end
end

def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'
end
