feature 'Sending a new peep' do
  scenario 'A user can send a peep to chitter' do
    visit('/send_peep')
    fill_in('peep', with: 'Hello this is a new peep')
    click_button('Send Peep')

    expect(page).to have_content 'Hello this is a new peep'
  end
end
