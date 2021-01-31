# Homepage tests
feature 'Homepage' do
  scenario 'User visits the home page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
