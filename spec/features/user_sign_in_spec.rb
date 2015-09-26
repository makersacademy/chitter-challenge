require './spec/factories/user'

feature 'User Sign in' do

  scenario 'with correct details' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end


  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

end
