feature 'the site has a homepage' do
  scenario 'the user visits the homepage' do
    visit('/')
    expect(page).to have_content("Chitter")
  end
end
