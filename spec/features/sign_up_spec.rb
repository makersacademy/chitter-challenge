feature 'sign-up' do
  scenario 'a new user can sign-up' do
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
    expect(current_path).to eq '/peeps'

    expect(page).to have_content(name)
    expect(page).to have_content(username)
  end
end
