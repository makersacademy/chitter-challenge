require './spec/factories/user'

feature 'User Sign Out' do

  scenario 'while being signed in' do
    user = create :user
    sign_in_as(user)
    click_button 'Sign out'
    expect(page).to have_content "Goodbye"
  end


  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

end
