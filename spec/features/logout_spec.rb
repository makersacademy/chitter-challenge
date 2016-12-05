require 'spec_helper'

feature 'log out' do

  scenario 'user can log out' do
    sign_up
    sign_in
    click_button 'Log Out'
    expect(current_path).to include '/peeps'
  end
end
