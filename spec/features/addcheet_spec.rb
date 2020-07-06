feature 'Add Peep' do
  scenario 'User Logs in, clicks Add Cheet. Fill in details. Visits page and Peep is there' do
    logintopage
    addpeep
    expect(page).to have_content("This is a first Peep")
  end
end