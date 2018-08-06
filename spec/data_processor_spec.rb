require './model/data_processor'
describe DataProcessor do
  let(:verification)  { double :verification  }
  let(:db_proc_class) { double :db_proc_class }
  before(:each) do 
    add_users_to_db 
    allow(db_proc_class).to receive(:environment)
    DataProcessor.create(verification, db_proc_class)
  end
  describe '#.verification' do
    it { expect(DataProcessor).to respond_to(:create).with(2).argument }
  end
  context 'Account related methods and succesfull verification' do
    before(:each) do
      allow(verification).to receive(:username_exists?).and_return(false)
      allow(verification).to receive(:password_match?).and_return(true)
      allow(verification).to receive(:valid_email?).and_return(true)
      allow(verification).to receive(:valid_password?).and_return(true)
      allow(db_proc_class).to receive(:write)
    end
    describe '#.login' do
      it { expect(DataProcessor).to respond_to(:login).with(2).arguments }
      it 'logs in and mends current user on succesfull login' do
        DataProcessor.login('JackIsCool', 'hello')
        expect(DataProcessor.current_user).to eq('JackIsCool')
      end
    end
    describe '#.logout' do
      it { expect(DataProcessor).to respond_to(:logout)  }
      it { expect(DataProcessor.logout).to eq(nil)       }
      it { expect(DataProcessor.current_user).to eq(nil) }
    end
    describe '#.create_account' do
      it { expect(DataProcessor).to respond_to(:create_account) }
      it { expect(DataProcessor.create_account({ username: 'jack',
                                                 password: '123qweasdsf',
                                                 email: 'anemail@gmail.com',
                                                 name: 'Jack' }
                                                )).to eq('account created')
      }
    end
    describe '#.update_account' do
      it { expect(DataProcessor).to respond_to(:update_account) }
    end
    describe '.delete_account' do
      it { expect(DataProcessor).to respond_to(:delete_account) }
      it { expect(DataProcessor.delete_account).to eq('account deleted') }
    end
    describe '.current_user' do
      it { expect(DataProcessor).to respond_to(:current_user) }
      it { expect(DataProcessor.current_user).to eq(nil) }
    end
  end
  context 'Message methods' do
    describe '#.post_message' do
      before(:each) do
         allow(verification).to receive(:valid_message?).and_return(true)
         allow(db_proc_class).to receive(:write)
        end
      it { expect(DataProcessor).to respond_to(:post_message).with(1).argument}
      it { expect(DataProcessor.post_message({ msg: 'hello' })).to eq('You just twatted!') }
    end
  end
  context 'unsucesfull verifications' do
    before(:each) do
      allow(verification).to receive(:username_exists?).and_return(true)
      allow(verification).to receive(:password_match?).and_return(false)
      allow(verification).to receive(:valid_email?).and_return(false)
      allow(verification).to receive(:valid_password?).and_return(false)
      allow(verification).to receive(:valid_message?).and_return(false)
      allow(db_proc_class).to receive(:write)
      @current_user = nil
    end
    describe '#.login' do
      it { expect(DataProcessor.login('invaliduser', 'buhbye')).to eq('credentials invalid') }
    end
    describe '#.logout' do
      it { expect(DataProcessor.logout).to eq('Not Logged in') }
    end
    describe '#.create_account' do
      it { expect(DataProcessor.create_account({ username: 'nobody',
                                                 password: 'invalidpassword',
                                                 email: 'invalidemail',
                                                 name: 'notaname' }
                                                )).to eq('invalid email')
}
    end
    describe '#.post_message' do
      it { expect(DataProcessor.post_message({ msg: 'averylongmsg' })).to eq('above character limit') }
    end
  end
end
