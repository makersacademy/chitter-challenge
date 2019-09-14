feature 'Homepage' do
  scenario 'display a welcome to the user' do
    visit('/')
    expect(page).to have_content 'Test infrastructure working.'
  end
end
