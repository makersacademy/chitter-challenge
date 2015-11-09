
require 'spec_helper'

feature 'User signs in' do

  scenario 'with correct credentials' do
    user =      User.new(user_name: 'atulord', email: 'a@bc.com',
                password: '1234',
                password_confirmation: '1234')
    user.save
    sign_in('atulord', '1234')
    expect(page).to have_content('Hello atulord!')
  end
end
