feature 'Peeps' do

  let(:user) do
    User.create(name: 'Test Test', username: 'Test_test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
  end

  scenario "I can post a peep when logged in" do
    sign_in(email: user.email, password: user.password)
    click_button 'Peep'
    expect{ post_peep }.to change(Peep, :count).by 1
  end

end
