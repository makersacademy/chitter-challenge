feature 'post' do
  scenario 'should post a peep marked with the username of the user who has signed in' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'anouska hopkins'
    expect(page).to have_content 'ahopkins94'
  end
end
