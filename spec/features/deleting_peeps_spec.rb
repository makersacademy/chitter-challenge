feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(message: "Message 1", name: "Jo",)
    visit('/peeps')
    expect(page).to have_content("Message 1")

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content("Message 1")
  end
end
