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
end
