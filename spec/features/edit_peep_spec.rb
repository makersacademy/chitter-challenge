feature 'Edit peep' do 
  scenario 'alters a peep' do
    Peep.create(message: "whatever")
    visit('/feed')
    expect(page).to have_content "whatever"
    first('.peep').click_button "Edit"
    fill_in('peep', with: "Actually no")
    click_button "Update"
    expect(current_path).to eq '/feed'
    expect(page).not_to have_content "whatever"
    expect(page).to have_content "Actually no"
  end
end
