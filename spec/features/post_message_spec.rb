feature 'post message' do
  scenario 'user can post a new message' do
    name = 'Bob Geldof'
    username = 'begeldof'
    email = 'its.me@bobgeldof.com'
    password = 'bob123'

    visit('/users/new')
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Submit')

    msg = 'I love chitter'

    visit('/peeps/new')
    fill_in('message', with: msg)
    click_button('Submit')

    expect(page).to have_content(msg)
  end
end
