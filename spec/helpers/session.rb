module SessionHelpers
  def sign_up
    visit '/'
    expect(page.status_code).to eq(200)
    click_button "Create new account"
    fill_in :username, with: "troi99"
    fill_in :email, with: "dtroi@starfleet.com"
    fill_in :name, with: "Deanna Troi"
    fill_in :password, with: "imzadi"
    fill_in :password_confirmation, with: "imzadi"
    click_button 'Sign up'
  end


  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: "troi99"
    fill_in :password, with: "imzadi"
    click_button 'Sign in'
  end

end
