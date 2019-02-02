feature 'Test homepage' do
  scenario 'has a welcome message' do
    visit('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end
