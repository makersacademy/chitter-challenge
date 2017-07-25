feature 'User management' do
  scenario 'Shows a welcome message on the front page' do
    visit "/"

    expect(page).to have_content("Welcome to Chitter!")
  end
end
