
feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com',
                user_name: 'Timmy1'
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  scenario 'with correct sign in details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'i want to post on a peep on chitter' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Got something to say?"
  end

  scenario "authenticated user can post a chitter message" do
        sign_up
        click_button "Post a Peep"
        expect(page).to have_content "Submit Peep"
        fill_in :message, with: "Test!"
        click_button "Submit Peep"
        expect(page).to have_content  "test!"
        expect(page).to have_content "From: Timmy1"
  end
end
