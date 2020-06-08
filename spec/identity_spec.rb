# frozen_string_literal: true

require './lib/identity.rb'
describe '.all ' do
  let(:name) { 'Big Dom Cummings' }
  let(:password) { 'BarnardCastle260' }
  let(:identity) { Identity.new(name, password) }

  it 'stores name and password of person signing in' do
    expect(identity.name).to eq 'Big Dom Cummings'
    expect(identity.password).to eq 'BarnardCastle260'
  end
end
