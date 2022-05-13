feature 'Adding peeps' do
  scenario 'A user can add Peeps to Chitter' do
    visit('/peeps/new')
    fill_in 'peep', with: 'Today has been wonderful!'
    click_button 'Peep'
    expect(page).to have_content "Today has been wonderful!"
  end
end
