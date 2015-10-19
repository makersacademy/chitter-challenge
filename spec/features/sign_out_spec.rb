require 'spec_helper'

feature 'Sign Out' do
  scenario 'only while being signed in already' do
    user = create :user
    sign_in(user)
    click_button 'Sign Out'
    expect(current_path).to eq '/'
  end
end
