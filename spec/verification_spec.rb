require './model/verification'
describe Verification do
  before(:each) { add_users_to_db }
  context 'Non db verification' do
    describe '#valid_password' do
      it { expect(Verification).to respond_to(:valid_password?).with(1).argument }
      it { expect(Verification.valid_password?('123qweasdzxc')).to eq(true) }
      it { expect(Verification.valid_password?('tooshor1')).to eq(false) }
      it { expect(Verification.valid_password?('nonumbersinhere')).to eq(false) }
    end
    describe '#valid_email' do
      it { expect(Verification).to respond_to(:valid_email?).with(1).argument }
      it { expect(Verification.valid_email?('jack@gmail.com')).to eq(true) }
      it { expect(Verification.valid_email?('fakeemail')).to eq(false) }
      it { expect(Verification.valid_email?('notextafter@')).to eq(false) }
      it { expect(Verification.valid_email?('nodotcom@gmail')).to eq(false) }
    end
    describe '.valid_message' do
      it { expect(Verification).to respond_to(:valid_message?).with(1).argument }
      it { expect(Verification.valid_message?('hello')).to eq(true) }
    end
  end
  context 'db verification' do
    describe '#username_exists?' do
      it { expect(Verification).to respond_to(:username_exists?).with(1).argument }
      it { expect(Verification.username_exists?('JackIsCool')).to eq(true) }
      it { expect(Verification.username_exists?('fakeusername')).to eq(false) }
    end
    describe '#password_valid?' do
      it { expect(Verification).to respond_to(:password_match?).with(2).arguments }
      it { expect(Verification.password_match?('JackIsCool', 'hello')).to eq(true) }
      it { expect(Verification.password_match?('JackIsCool', 'wrong')).to eq(false) }
    end
  end

end
