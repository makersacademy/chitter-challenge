feature 'sign in' do
  scenario 'it should sign in a user' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    expect(page).to have_content "Welcome ahopkins94"
  end
  scenario 'a user sees an error if they get their username wrong' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'idontexist')
    fill_in('password', with: 'hello')
    click_button('submit')
    expect(page).to have_content 'Please check your username or password'
  end
  scenario 'a user sees an error if they get their password wrong' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'wrongpassword')
    click_button('submit')
    expect(page).to have_content 'Please check your username or password'
 end
end
