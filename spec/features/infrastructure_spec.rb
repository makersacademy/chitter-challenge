feature '/' do
  scenario 'Can visit the homepage and see a message' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
end