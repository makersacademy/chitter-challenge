feature 'user log in' do

  let!(:user) do
    User.create(name: 'Kate McCaffrey',
                user_name: 'Mac',
                email: 'mac@shaper.com',
                password: 'netrunner1')
  end

  scenario 'log in using the correct details' do
    sign_up
    log_in
    expect(page).to have_content "Welcome to chitter #{user.name}"
  end

end
