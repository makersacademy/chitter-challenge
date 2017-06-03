feature 'Testing infrastructure' do
  scenario 'User can visit the page and see content' do
    visit '/'
    expect(page).to have_content('Testing infrastructure working!')
  end
end
