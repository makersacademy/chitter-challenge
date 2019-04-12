feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end

feature "visiting the peers page" do
  scenario "show the list of peers" do
    visit "/peers"
    expect(page).to have_content "What are Makers saying:"
    expect(page).to have_content "First test peer"
  end
end
