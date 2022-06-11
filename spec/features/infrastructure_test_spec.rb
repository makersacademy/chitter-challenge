feature 'Infrastructure Test' do
  scenario 'visiting home page displays app name' do
    visit('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end
