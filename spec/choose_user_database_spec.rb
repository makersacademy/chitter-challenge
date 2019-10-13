require 'choose_user_database'

describe '#which_database' do
  it 'chooses the test database when testing' do
    expect(which_user_database).to eq 'test_chitter_username_database'
  end

  it 'chooses the regualr database when not testing' do
    allow(ENV).to receive(:[]).with("ENVIRONMENT").and_return("not testing")
    expect(which_user_database).to eq 'chitter_username_database'
  end
end
