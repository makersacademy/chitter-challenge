feature 'A user can visit the app' do
  scenario 'A user goes to the site and gets a 200 status' do
    visit("/")
    expect(page.status_code).to eq 200
  end
end