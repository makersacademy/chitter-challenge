require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    user = User.create!(email: 'instance_user@test.com')
    expect(user.email).to eq('instance_user@test.com')
  end
end