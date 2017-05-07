feature "Signs up a user" do

  scenario "accesses the sign up page" do
    User.create(name: "Chris Mitchell", username: "chrisjmit", email: "chris.mitchell@email.co.uk", password: "password1")
    visit('/users')
    expect(page.status_code).to eq 200
      within 'ul#users' do
      expect(page).to have_content('Chris Mitchell')
    end
  end



end
