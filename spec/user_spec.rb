require 'spec_helper'
require_relative '../models/user'

describe User do

  it 'will set redirect to failed-login if user not signed up' do
    User.login_check("the_ceo")
    expect(User.redirect).to eq '/failed-login'
  end

  it 'will set redirect to logged in if user has signed up' do
    User.create(name: "Malinna Leach", username: "the_ceo", email: "ceo@chitter.com", password: "s3cr3t")
    User.login_check("the_ceo")
    expect(User.redirect).to eq '/home'
  end

end
