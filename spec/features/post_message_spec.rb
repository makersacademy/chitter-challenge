feature 'post message' do
  let(:msg) { 'I love peeps!' }

  scenario 'user can post a new message' do
    signup_helper
    expect(current_path).to eq '/peeps'

    visit('/peeps/new')
    fill_in('message', with: msg)
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    table = page.find('table[class="peeps"]')
    expect(table).to have_content(msg)
  end

  scenario 'messages have name and user handle' do
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

    visit('/peeps/new')
    fill_in('message', with: msg)
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    table = page.find('table[class="peeps"]')
    expect(table).to have_content(name)
    expect(table).to have_content(username)
  end
end
