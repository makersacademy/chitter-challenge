feature 'Test' do
  scenario 'Testing visiting index page of Chitter' do
    visit('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end
