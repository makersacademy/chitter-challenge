feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Welcome to Chitter on the homepage' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter!")
  end
end
