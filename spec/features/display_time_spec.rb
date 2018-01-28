feature 'Display the peeps time' do
  scenario 'see the time of the peep' do
    visit('/peeps/new_peep')
    Peep.first_or_create(peep_name: 'Hello great day!', time: '2018-01-28 13:26:30 +0000')
    click_button 'Send'
    expect(page).to have_content('Hello great day!')
    expect(page).to have_content('2018-01-28 13:26:30 +0000')
  end
end
