require 'login_helper'
require 'user_repository'

RSpec.describe LoginHelper do
  before(:each) do
    reset_tables
    @users = UserRepository.new.all
  end

  it 'checks whether any users are logged in' do

    helper = LoginHelper.new(@users)
    result = helper.any_logged_in?

    expect(result).to eq false
  end
end