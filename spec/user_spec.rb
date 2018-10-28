require 'user'

describe User do
  it 'creates a user on sign-in' do
    expect(subject.sign_in).to eq 'Greg'
  end
end
