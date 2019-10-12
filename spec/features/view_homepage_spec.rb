feature 'home page displays correctly' do
  scenario 'A user can visit the home page' do
    visit ('/')
    expect(page).to have_content 'Chitter'
  end
end