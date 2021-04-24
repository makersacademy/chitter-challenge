feature 'Testing infrastucture' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_selector("input[type=submit][value='View Peeps']")
    expect(page).to have_selector("input[type=submit][value='Post a Peep']")
  end
end
