require 'spec_helper'

describe User do

  it 'contains user' do
    create(:user)
    expect(User.map(&:name)).to include('test user')
  end

end