feature 'Viewing Chitter feed' do
  scenario 'Visiting the homepage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
