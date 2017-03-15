feature "Navbar" do

  email = "bob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  password = "password"

  before(:each) do
    sign_up(email: email, name: name, handle: handle, password: password)
  end

  feature 'User is signed in and has user options' do
    scenario 'logged-in' do
      sign_in(email: email, password: password)
      visit "/peeps"
      expect(page.status_code).to be(200)
      expect(page).to have_selector(:link_or_button, 'Sign Out')
      expect(page).to have_selector(:link_or_button, 'Profile')
      expect(page).to have_selector(:link_or_button, 'Peep')
      expect(page).to have_selector(:link_or_button, 'Search')
      expect(page).to have_content("Signed in as #{handle}")
    end
  end

  feature 'User is signed out and does not have user options' do
    scenario 'logged-out' do
      sign_in(email: email, password: password)
      sign_out
      visit "/peeps"
      expect(page.status_code).to be(200)
      expect(page).to have_selector(:link_or_button, 'Sign In')
      expect(page).to have_selector(:link_or_button, 'Sign Up')
      expect(page).to have_selector(:link_or_button, 'Search')
      expect(page).not_to have_selector(:link_or_button, 'Sign Out')
      expect(page).not_to have_selector(:link_or_button, 'Profile')
      expect(page).not_to have_selector(:link_or_button, 'Peep')
      expect(page).not_to have_content("Signed in as #{handle}")
    end
  end

  feature 'User can sort Peeps in ascending order' do




  end

end
