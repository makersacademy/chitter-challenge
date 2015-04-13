require 'spec_helper'

describe Peep do
  it 'it expects to be created and retrieved from the database' do
    user = User.create(name: 'Rob',
                       handle: '@rbgeorob',
                       email: 'rob@test.com',
                       password: 'hello',
                       password_confirmation: 'hello')
    expect(described_class.count).to eq(0)
    described_class.create(content: 'Hello this is a peep',
                           user: user)
    expect(described_class.count).to eq(1)
    peep = described_class.first
    expect(peep.content).to eq('Hello this is a peep')
    expect(peep.user.handle).to eq('@rbgeorob')
  end
  it 'is rejected is there is no user' do
    expect(described_class.count).to eq(0)
    described_class.create(content: 'Hello this is a peep',
                           user: nil)
    expect(described_class.count).to eq(0)
  end

end