feature 'view message time' do
  scenario 'view the time messages were posted' do
    signup_helper

    visit('/peeps/new')
    msg_1 = 'msg_1'
    fill_in('message', with: msg_1)
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S%z')[0,22]
    click_button('Submit')

    table = page.find('table[class="peeps"]')
    expect(table).to have_content(time)
  end
end
