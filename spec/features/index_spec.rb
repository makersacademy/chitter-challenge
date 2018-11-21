feature 'index page' do
  scenario 'visit index page' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end
