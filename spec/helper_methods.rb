module HelperMethods

  def add_peep content = 'test'
    post = Peep.create(content: content, time: Time.new)
  end

  def sign_in(email = 'test@test.com', password = '12345')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'log in'
  end

end