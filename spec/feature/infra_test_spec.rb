<<<<<<< HEAD
feature "Home page loads" do
  scenario "has content on the home page" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
=======
feature "test infrastructure working" do
  scenario "has content on the home page" do
    visit '/'
    expect(page).to have_content "Hello world"
>>>>>>> ea38a010acdb864682f138155a8a1e3ee542ca8d
  end
end
