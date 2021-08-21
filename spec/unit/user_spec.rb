require 'user'

describe User do

  context '.create' do
    it 'creates a User' do
      User.create(handle: 'Maker', email: 'fake_email.gmail.com', password: '1234')
      expect(User.handle(handle: 'Maker')).to have_attributes(handle: 'Maker', email: 'fake_email.gmail.com', password: '1234')
    end
  end

end
