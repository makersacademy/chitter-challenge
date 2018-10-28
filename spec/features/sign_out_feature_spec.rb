feature 'sign_out' do
  scenario 'a user can sign out' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    click_button 'sign out'
    expect(page).to have_content 'You have signed out'
  end
end
