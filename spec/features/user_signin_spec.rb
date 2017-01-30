# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature '1.Sign up for Chitter' do

  scenario 'to post messages - user should register first' do

    visit '/'
    click_button('Sign up')

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, hello@mail.com!')

  end

  scenario "can't sign up without an email address" do
    visit '/signup'
    fill_in :name, with: "Barbara"
    fill_in :username, with: 'barbara_s'
    fill_in :email, with: ""
    fill_in :password, with: '1234'
    click_button('Submit')

   expect(page).to have_content 'No email entered'
  end

  scenario 'email and username should be unique' do

  end
end
