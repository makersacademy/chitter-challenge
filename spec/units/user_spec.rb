require 'user'

RSpec.describe User do

  context 'After logging in'do
    it 'has a username' do
      subject.log_in('billy1')
      expect(subject.username).to eq 'billy1'
    end

    it 'has a name' do
      subject.log_in('billy1')
      expect(subject.name).to eq 'Billy'
    end

    it 'has an email' do
      subject.log_in('billy1')
      expect(subject.email).to eq 'billy@mail.com'
    end
  end

  context 'After logging out' do
    it 'does not have a username' do
      subject.log_in('billy1')
      subject.log_out
      expect(subject.username).to eq nil
    end

    it 'does not have a name' do
      subject.log_in('billy1')
      subject.log_out
      expect(subject.name).to eq nil
    end

    it 'does not have an email' do
      subject.log_in('billy1')
      subject.log_out
      expect(subject.email).to eq nil
    end
  end
end
