feature 'message order' do
  scenario 'view messages in reverse chronological order they were posted' do
    signup_helper

    visit('/peeps/new')
    msg_1 = 'msg_1'
    fill_in('message', with: msg_1)
    click_button('Submit')

    visit('/peeps/new')
    msg_2 = 'msg_2'
    fill_in('message', with: msg_2)
    click_button('Submit')

    visit('/peeps/new')
    msg_3 = 'msg_3'
    fill_in('message', with: msg_3)
    click_button('Submit')

    tr = page.find('tr[peep="0"]')
    expect(tr).to have_css('td.message', text: msg_3)

    tr = page.find('tr[peep="2"]')
    expect(tr).to have_css('td.message', text: msg_1)
  end
end
