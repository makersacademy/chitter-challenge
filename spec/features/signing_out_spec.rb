require 'spec_helper'

feature 'Sigining Out' do

  scenario 'once signed in' do
    user =      User.new(user_name: 'atulord', email: 'a@bc.com',
                password: '1234',
                password_confirmation: '1234')
    user.save
    sign_in('atulord','1234')
    click_button('Sign out')
    expect(current_path).to eq('/')
    expect(page.status_code).to eq 200
  end
end
