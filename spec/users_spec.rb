require 'user'

describe User do

  it 'should store id, first name and last name' do
    user = User.new(id: 1, fname: 'abdi', lname: 'abdi')

    expect(user.id).to eq 1
    expect(user.fname).to eq 'abdi'
    expect(user.lname).to eq 'abdi'
  end
end
