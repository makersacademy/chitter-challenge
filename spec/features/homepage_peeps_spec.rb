feature 'Homepage displays peeps' do
  scenario 'displays name, username, time created and text' do
    visit('/')
    expect(page).to have_content("Taran")
    expect(page).to have_content("taran314")
    expect(page).to have_content("2021-01-05 08:12:01")
    expect(page).to have_content("Windows > Mac")
  end
end
