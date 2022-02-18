feature 'Testing infrastructure' do
  scenario 'directs to the home page' do
    visit('/')
    expect(page).to have_content 'Hello, world!'
  end
end
