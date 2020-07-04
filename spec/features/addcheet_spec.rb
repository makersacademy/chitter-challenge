feature 'Add Cheet' do
  scenario 'User Logs in, clicks Add Cheet. Fill in details. Visits page and Cheet is there' do
    logintopage
    click_button('Add Cheet')
    fill_in'Cheet_text', with: "This is a first Cheet"
    click_button('Add Cheet')
    expect(page).to have_content("This is a first Cheet")
    expect(page.to have_content("2020"))
  end
end