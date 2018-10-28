feature 'post' do
  scenario 'should post a peep after signing up' do
    visit '/'
    click_button 'sign up'
    fill_in('email', with: 'anouskahopkins@gmail.com')
    fill_in('password', with: 'hello')
    fill_in('name', with: 'anouska hopkins')
    fill_in('username', with: 'ahopkins94')
    click_button 'submit'
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'Anouska Hopkins'
    expect(page).to have_content 'ahopkins'
  end
  scenario 'should post a peep after signing in' do
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
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'Anouska Hopkins'
    expect(page).to have_content 'ahopkins'
  end
end
