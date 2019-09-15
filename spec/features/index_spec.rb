feature 'Testing index page' do
  scenario 'View <Hello! You are on Chitter> displayed' do
    visit('/')
    expect(page).to have_content 'Hello! You are on Chitter'
  end
end
