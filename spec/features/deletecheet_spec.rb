feature 'Delete Peep' do
  scenario 'User Logs in, clicks Delete Cheet. Visits page and Peep is not there' do
    logintopage
    addpeep
    click_button('Delete Peep')
    click_button('Delete Peep')
    expect(page).not_to have_content("This is a first Peep")
  end
end