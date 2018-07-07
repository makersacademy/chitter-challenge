feature 'Testing homepage works' do
  scenario 'can see homepage content' do
    visit('/')
    expect(page).to have_content 'Hello World!'
  end
end
