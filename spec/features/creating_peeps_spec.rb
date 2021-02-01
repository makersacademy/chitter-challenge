feature 'creating a new_peep' do
  scenario 'you can see your new_peep' do
    visit('/')
    fill_in('peep', with: 'Hi')
    click_button('Peep!')
    expect(page).to have_content 'Hi'
  end

  scenario 'time of peep visible to user' do
    time_match = Peep.new_peep(username: 'dude', peep: 'peep')
    visit('/')
    fill_in('peep', with: 'time')
    click_button('Peep!')
    expect(page).to have_content time_match.time
  end
end