feature 'Testing infrastructure' do
  scenario 'Testing if it returns hello world' do
    visit('/')
    expect(page).to have_content 'Hello world'
  end
end
