feature 'Testing infrastructure' do
  scenario 'Page loads' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end
