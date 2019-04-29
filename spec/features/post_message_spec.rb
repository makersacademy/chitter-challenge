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
    signup_helper
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
