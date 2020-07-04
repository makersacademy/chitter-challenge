feature 'Add Peep' do
  scenario 'User Logs in, clicks Add Cheet. Fill in details. Visits page and Peep is there' do
    logintopage
    click_button('Add Peep')
    fill_in'peep_text', with: "This is a first Peep"
    click_button('Add Peep')
    expect(page).to have_content("This is a first Peep")
  end
end