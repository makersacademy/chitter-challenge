feature 'Testing infrastructure' do
  scenario 'Display test string at root route' do
    visit '/'
    expect(page).to have_content("Testing infrastructure working")
  end
end
