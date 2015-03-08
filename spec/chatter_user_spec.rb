require 'spec_helper'

describe 'ChatterUser' do

  let(:user) {ChatterUser.create(name: 'Phillus', creation_date: Time.now)}

  it 'Has a name' do
    expect(user.name).to eq 'Phillus'
  end

end
