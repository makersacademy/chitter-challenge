feature 'sign_out' do
  scenario 'a user can sign out' do
    visit '/'
    click_button 'sign up'
    fill_in('email', with: 'anouskahopkins@gmail.com')
    fill_in('password', with: 'hello')
    fill_in('name', with: 'anouska hopkins')
    fill_in('username', with: 'ahopkins94')
    click_button 'submit'
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    click_button 'sign out'
    expect(page).to have_content 'You have signed out'
  end
end
