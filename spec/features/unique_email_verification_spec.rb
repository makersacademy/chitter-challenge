require 'spec_helper'
require './app/models/user.rb'
require 'web_helper'


RSpec.feature "Chitter" do
scenario 'I cannot sign up with an existing email' do
  sign_up
  expect { sign_up }.to_not change(User, :count)
  expect(page).to have_content('Email is already taken')
end
end
