require 'helpers'

feature '#email to be validated' do
  include Helpers

  scenario 'User not to sign-up with incorrect email' do
    expect { sign_up_wrong_email }.not_to change(User, :count)
  end

  scenario 'User to be able to sign-up with correct email ' do
    expect { sign_up }.to change(User, :count)
  end

end
