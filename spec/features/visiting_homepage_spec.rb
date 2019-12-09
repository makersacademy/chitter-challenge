feature "visiting the homepage" do
  scenario "there should be a heading and title" do
    visit '/'
    expect(page).to have_title 'Chitter'
    expect(page).to have_selector 'h1', text: 'Chitter'
  end
end
