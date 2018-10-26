feature "Deleting a peep" do
  scenario 'A user can delete a peep' do
    Peep.create(message: 'test message', user_name: 'test_user')
    visit('/peeps')
    expect(page).to have_content('test message')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('test message')
  end
end
