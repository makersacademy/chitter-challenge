feature '#index' do
  scenario "it prints welcome to chitter on the homepage" do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end