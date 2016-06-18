
feature 'Sign In' do

  before :each do
    sign_up
    Capybara.reset!
  end

  scenario 'can sign in with email and password' do
    visit '/'
    fill_in :email, with: 'alex@hotmail.com'
    fill_in :password, with: 'test1234'
    click_button 'Sign In'
    user = User.first
    expect(user.user_name).to eq 'as4273'
  end

  scenario "can be redirected to sign up page if you can't sign in" do
    visit '/'
    click_button 'Sign Up?'
    expect(current_path).to eq '/users/new'
  end

end