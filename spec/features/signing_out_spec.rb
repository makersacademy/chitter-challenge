feature 'user signs out' do
  scenario 'after signing up' do
    sign_up_steph
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Steph'
  end

  scenario 'after signing in' do
    sign_up_steph
    sign_up_jane
    visit '/sessions/new'
    fill_in('username', with: 'StephanieJane')
    fill_in('password', with: 'steph123')
    click_button 'Submit'
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Steph'
  end

end
