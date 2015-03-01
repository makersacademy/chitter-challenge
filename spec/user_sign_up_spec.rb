require 'spec_helper' 

feature 'User sign up' do 

  scenario 'signing up' do 
    expect(lambda { sign_up }).to change(User, :count).by 1
    expect(page).to have_content("What's on your mind, John117?")
  end

  def sign_up(name = "John117", email = "aaa@email.com", password = "0451")
    visit '/user'
    fill_in :name, :with => name
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_on "sign up"
  end
end