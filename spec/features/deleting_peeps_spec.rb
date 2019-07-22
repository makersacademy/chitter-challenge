feature 'Deleting a peep' do
  scenario 'A user can delete a peep if they have morning regret' do
    Peeps.create(peep: "Today is Wednesday", time: Time.now)
    visit '/'
    click_button 'View peeps'
    expect(page).to have_content "Today is Wednesday"
    first('.peep-meta').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content("Today is Wednesday")
  end
end
