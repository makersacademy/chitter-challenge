require 'login_controller'

describe LoginController do

  it 'can check is a passowrd is correct' do
    expect(LoginController.log_in('kks110', 'test')).to eq true
  end

end
