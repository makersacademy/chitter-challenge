feature 'Testing infrastucture' do
  scenario 'Can run app and check page content' do
    visit('/')
    # expect(page).to have_selector("input[type=submit][value='View Peeps']")
    # expect(page).to have_selector("input[type=submit][value='Post a Peep']")
    # expect(page).to have_selector("input[type=submit][value='New Peeps first']")
    # expect(page).to have_selector("input[type=submit][value='Sign Up']")
    expect(page).to have_content "select an option"
  end
end
