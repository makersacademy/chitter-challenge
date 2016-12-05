require 'spec_helper.rb'

feature 'viewing peeps' do

  let!(:user) do
    User.create(name: 'Amanda',
                username: 'amanda',
                email: 'hello@example.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'user can see existing peeps' do
    sign_in(email: user.email, password: user.password)
    peep

    within 'ul#peeps' do
      expect(page).to have_content('I have just joined Chitter!')
    end
  end

end
