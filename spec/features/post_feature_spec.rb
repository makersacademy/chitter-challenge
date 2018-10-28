feature 'post' do
  scenario 'should post a peep after signing up' do
    sign_up
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'Anouska Hopkins'
    expect(page).to have_content 'ahopkins'
  end
  scenario 'should post a peep after signing in' do
    sign_up
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'Anouska Hopkins'
    expect(page).to have_content 'ahopkins'
  end
end
