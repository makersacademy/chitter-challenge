feature 'Updating peeps' do
  scenario 'A user can update a peep' do
    Peep.update(id: 'message')
    visit('/peeps')

    expect(page).to have_message('Update my message', created_at: timestamps)

    first('.peep').click_button 'Update'

    expect(user_id).to eq user.id
    expect(peep).not_to have_peep.id('Update my message', created_at: timestamps)
  end
end
