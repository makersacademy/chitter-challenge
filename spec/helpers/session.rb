module SessionHelpers
  def sign_up
    visit '/user/new'
    fill_in(:name, with: 'Maker Makerson')
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:username, with: 'makermakerson')
    fill_in(:password, with: 'maker123')
    fill_in(:password_confirmation, with: 'maker123')
    click_button('Sign up')
  end
end
