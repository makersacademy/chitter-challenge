require 'spec_helper'

feature 'add user' do

  scenario 'create a new user' do
    visit '/'
    click_button 'Sign up'
    create_user

    expect(current_path).to eq '/signup'
    expect(page.status_code).to eq 200

    expect{click_button 'Confirm'}.to change{User.count}.by(1)
    within "ul#users" do
      expect(page).to have_content 'Sign up successful'
    end
  end

end
