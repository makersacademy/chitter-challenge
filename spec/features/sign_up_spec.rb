feature 'Signing up' do
  scenario "A user fills out their email and password a new user is created" do
    expect { signup }.to change(User, :count).by(1)
  end
  scenario "After signing up they are welcomed by their email address " do
    signup
    expect(page).to have_content "Welcome, fake@fake.com"
  end
end
