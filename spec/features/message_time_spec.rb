feature 'view message time' do
  scenario 'view the time messages were posted' do
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

    visit('/peeps/new')
    msg_1 = 'msg_1'
    fill_in('message', with: msg_1)
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S%z')[0,22]
    click_button('Submit')

    table = page.find('table[class="peeps"]')
    expect(table).to have_content(time)
  end
end
