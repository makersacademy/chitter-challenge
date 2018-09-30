require 'user'

RSpec.describe User do

  context 'After logging in' do
    it 'has a username' do
      subject.log_in('billy1')
      expect(subject.username).to eq 'billy1'
    end

    it 'has user details' do
      subject.log_in('billy1')
      billy_hash = { id: "1", name: "Billy", email: "billy@mail.com" }
      expect(subject.user_details).to eq(billy_hash)
    end
  end

  context 'After logging out' do
    it 'does not have a username' do
      subject.log_in('billy1')
      subject.log_out
      expect(subject.username).to eq nil
    end

    it 'does not have user_details' do
      subject.log_in('billy1')
      subject.log_out
      expect(subject.user_details).to eq nil
    end
  end
end
