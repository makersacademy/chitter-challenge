module Helpers
  def sign_in(user)
    visit('/sessions/new')
    expect(page.status_code).to eq(200)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log in'
  end

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: user.name
    fill_in :username, with: user.username
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :confirmation, with: user.password
    click_button 'Sign up'
  end

  def post_peep(peep)
    visit '/peeps/new'
    expect(page.status_code).to eq(200)
    fill_in :content, with: peep.content
    click_button 'Peep!'
  end
end
