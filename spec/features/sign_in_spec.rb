require './spec/web_helper.rb'

feature 'User can sign in' do

  let!(:user) { User.create(email: 'tree@example.com', password: '12h34h56', password_confirmation: '12h34h56') }

  scenario 'with correct credentials' do

    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"

  end

end
