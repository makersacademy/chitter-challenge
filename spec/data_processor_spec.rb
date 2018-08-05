require './model/data_processor'
describe DataProcessor do
  before(:each)    { add_users_to_db }
  let(:verication) { double :verification }
  describe '#.set_up' do
    it { expect(DataProcessor).to respond_to(:set_up).with(1).argument}
  end
  context 'Account related methods' do
    describe '#.login' do
      it { expect(DataProcessor).to respond_to(:login) }
    end
    describe '#.logout' do
      it { expect(DataProcessor).to respond_to(:logout) }
    end
    describe '#.create_account' do
      it { expect(DataProcessor).to respond_to(:create_account) }
    end
    describe '#.update_account' do
      it { expect(DataProcessor).to respond_to(:update_account) }
    end
    describe '.delete_account' do
      it { expect(DataProcessor).to respond_to(:delete_account) }
    end
    describe '.current_user' do
      it { expect(DataProcessor).to respond_to(:current_user) }
      it { expect(DataProcessor.current_user).to eq(nil) }
    end
  end
  context 'Message methods' do
    describe '#.post_message' do

    end
  end
end
