# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature '1.Sign up for Chitter' do
  scenario 'to post messages - user should register first' do

    visit '/'
    click_button('Sign up')
    visit '/signup'

    expect(page).to have_content('Join Chitter today.')

    sign_up


    expect( current_path ).to eq '/messenger'




      #expect{register}.to change(User, :count).by(1)

    #  expect(current_path).to eq '/'
      # expect(page).to have_content('Welcome, hello@mail.com!')
      # expect{register}.to change(User, :count).by(1)

  end
end
