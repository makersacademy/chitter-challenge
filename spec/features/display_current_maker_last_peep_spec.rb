feature 'Display the last maker that posted the peep' do
  scenario 'see the maker name' do
    visit('/peeps/new_peep')
    Peep.first_or_create(peep_name: 'Hello great day!', time: '2018-01-28 13:26:30 +0000', last_maker: 'Lana')
    click_button 'Send'
    expect(page).to have_content('Hello great day!')
    expect(page).to have_content('2018-01-28 13:26:30 +0000')
    expect(page).to have_content('Lana')
  end
end
