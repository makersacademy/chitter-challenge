feature 'Sign In Page' do
  scenario 'Has form with submit button to login' do
    visit ('/')
    click_button 'Sign In'
    expect(page).to have_content 'CHITTER'
    expect(page).to have_button 'Sign In'
  end

  scenario 'User enters invalid login details return to sign in page' do
    visit ('/')
    click_button 'Sign In'
    fill_in('username', with: '@invalid' )
    fill_in('password', with: 'invalid' )
    click_button 'Sign In'
    expect(page).to have_content 'CHITTER'
    expect(page).to have_content 'Errrr...not quite right! Try again...'
    expect(page).to have_button 'Sign In'
  end
end
