feature 'Testing index page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Login"
  end
end
