feature 'user signing in to Chitter' do

  scenario 'successful sign in' do
    sign_up_steph
    sign_up_jane
    visit '/sessions/new'
    fill_in('username', with: 'StephanieJane')
    fill_in('password', with: 'steph123')
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter Steph'
  end

end
