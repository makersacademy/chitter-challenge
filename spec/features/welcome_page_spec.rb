feature 'show landing page' do
  scenario 'welcome page' do
    visit('/')
    expect(page).to have_content('welcome to Chitter')
  end
end