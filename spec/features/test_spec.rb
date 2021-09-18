feature 'tester' do
  scenario 'test' do
    visit('/')
    expect(page).to have_content 'Hello world'
  end
end
