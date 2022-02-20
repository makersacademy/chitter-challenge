feature 'Open the homepage' do
  scenario 'A user can view the homepage' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end

