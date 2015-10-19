feature 'Like a Peep' do

  let(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end

  # scenario "I can like a peep that has been made" do
  #   sign_in(email: 'test@test.com', password: '12345')
  #   visit 'peeps/new'
  #   fill_in 'peep', with: 'testing testing 123'
  #   click_button
  # end
end
