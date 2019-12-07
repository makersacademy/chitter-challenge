feature 'Chitter' do
  scenario 'User can see the index page' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end
end
