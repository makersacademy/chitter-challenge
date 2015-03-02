require 'spec_helper'

feature 'User sign out' do 

  before do 
    @user = User.create(:name => "John117", :email => "aaa@email.com", :password => "0451")
  end

  scenario 'signing out' do 
    visit '/users/home'
    click_on 'sign out'
    expect(current_path).to eq '/'
    expect(page).to have_content("Please sign up")
  end
end