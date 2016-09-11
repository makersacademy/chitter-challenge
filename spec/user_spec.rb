require 'spec_helper'

describe User do
  let(:user) {User.create(name: "Sara",
     handle: "sarsar", email: "sar@sara.com",
    password: "cheese", password_confirmation: "cheese")
}

  it 'has a name, handle, email and password + confirmation' do
    expect(user.name).to eq "Sara"
  end

  it 'creates a user upon registration' do
    expect {register("ss","sam@sammy.com")}.to change(User, :count).by(1)
    expect(User.first.email).to eq('sam@sammy.com')
  end

  xit 'authenticates a user who logs in' do
    expect(User.authenticate("sar@sara.com", "cheese")).to eq user
  end

  it 'encrypts a password' do
    user.reload
    expect(user.password).not_to be "cheese"
  end

  it 'validates password with confirmed password' do
    expect {register_mismatched_passwords("ss","sam@sammy.com")}.not_to change(User, :count)
  end

end
