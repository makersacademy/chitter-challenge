module SessionHelpers

  def sign_up
    visit '/sign_up'
    fill_in(:name, with: 'chuck')
    fill_in(:email, with: 'chuckypdawg@gmail.com')
    fill_in(:username, with: 'chuckypdawg')
    fill_in(:password, with: '12345')
    click_button('Submit')
  end

end
