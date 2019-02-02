feature 'index' do
  scenario "expect simple index page" do
    visit("/")
    expect(page).to have_content('Welcome to Chitter')
  end
end
