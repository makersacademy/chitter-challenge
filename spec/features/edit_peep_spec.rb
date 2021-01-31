feature 'Edit peep' do 
  scenario 'alters a peep' do
    create_new_user_and_write_a_peep
    expect(page).to have_content "Hello this is a peep"
    first('.peep').click_button "Edit"
    fill_in('peep', with: "Actually no")
    click_button "Update"
    expect(current_path).to eq '/feed'
    expect(page).not_to have_content "Hello this is a peep"
    expect(page).to have_content "Actually no"
  end
end
