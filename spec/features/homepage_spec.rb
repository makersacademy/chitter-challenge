

feature 'Homepage' do
  scenario 'A welcome message is displayed when visiting' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end
