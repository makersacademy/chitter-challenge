feature 'Infrastructure' do
  scenario 'Main page loads' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end
