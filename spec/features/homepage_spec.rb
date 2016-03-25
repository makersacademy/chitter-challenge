feature 'Chitter Home Page' do
  scenario 'Index page is the peeps list' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
