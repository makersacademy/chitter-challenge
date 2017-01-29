# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  scenario 'to post messages - register first' do
    visit '/'
    click_button 'Sign up'

    visit '/signup'
      within 'ul#signup' do
        expect(page).to have_content('Join Chitter today.')
      end
      register
      #expect{register}.to change(User, :count).by(1)

    #  expect(current_path).to eq '/'
      # expect(page).to have_content('Welcome, hello@mail.com!')
      # expect{register}.to change(User, :count).by(1)

  end
end
