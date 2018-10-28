feature 'sign in' do
  scenario 'it should sign in a user' do
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
    expect(page).to have_content "Welcome ahopkins94"
  end
  scenario 'a user sees an error if they get their username wrong' do
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'idontexist')
    fill_in('password', with: 'ialsodontexist')
    click_button('submit')
    expect(page).to have_content 'Please check your username or password'
end
end
