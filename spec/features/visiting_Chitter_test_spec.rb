feature 'Test' do
  scenario 'Testing visiting Chitter' do
    visit('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end
