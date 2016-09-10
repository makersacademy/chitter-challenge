require 'spec_helper'

describe User do

  it 'has a name, handle, email and password + confirmation' do
    user = User.create(name: "Sara", handle: "sarsar", email: "sar@sara.com", password: "cheese", password_confirmation: "cheese")
    expect(user.name).to eq "Sara"

  end
end
