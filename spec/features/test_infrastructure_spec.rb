feature 'test infrastructure' do
  scenario 'user visits home page' do
    visit('/')
    expect(page).to have_content 'Test infrastructure working.'
  end
end
