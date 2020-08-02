feature 'Edit Peep' do
  scenario 'User Logs in, clicks Edit Peep. Visits page, edits and Peep is changed' do
    logintopage
    addpeep
    click_button('Edit Peep')
    fill_in'peep_text', with: "This is a changed Peep"
    click_button('Edit Peep')
    expect(page).not_to have_content("This is a first Peep")
    expect(page).to have_content("This is a changed Peep")
  end
end