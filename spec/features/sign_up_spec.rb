require './spec/web_helpers'

feature "Signs up a user" do

  scenario "accesses the sign up page" do
    User.create(name: "Chris Mitchell", username: "chrisjmit", email: "chris.mitchell@email.co.uk", password: "password1", password_confirmation: "password1")
    visit('/users')
    expect(page.status_code).to eq 200
      within 'ul#users' do
      expect(page).to have_content('Chris Mitchell')
    end
  end

  scenario "user adds details" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, allcourter@allsurfaces.com')
    expect(User.first.email).to eq ('allcourter@allsurfaces.com')
  end

  scenario 'cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
