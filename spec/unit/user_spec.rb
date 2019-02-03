RSpec.describe User do

  it 'should allow the user to be set' do
    expect { User.assign_user('testuser') }.to change { User.logged_in_name }.to('testuser')
  end

end
