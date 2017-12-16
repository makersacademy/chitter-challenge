feature 'Homepage' do
  scenario 'Displays a welcome message' do
    visit '/'
    expect(page).to have_content("Welcome")
  end
end
