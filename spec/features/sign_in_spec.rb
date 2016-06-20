
feature 'Sign In' do

  before :each do
    sign_up
    Capybara.reset!
    visit '/'
  end

  scenario 'can sign in with email and password' do
    sign_in
    user = User.first
    expect(user.user_name).to eq 'as4273'
  end

  scenario "can be redirected to sign up page if you can't sign in" do
    click_button 'Sign Up?'
    expect(current_path).to eq '/users/new'
  end
end