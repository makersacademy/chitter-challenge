feature 'check the homepage works' do

  scenario "should show the welcome message" do
    visit '/'
    expect(page).to have_content "Homepage"
  end
end
