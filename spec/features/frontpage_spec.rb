feature 'Viewing frontpage' do
  scenario 'user visits frontpage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end