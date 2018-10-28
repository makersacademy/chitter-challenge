require 'boot_up_connection'
describe 'boot_up_connection' do
  it "sets database connected to to test" do
    expect(Connection).to receive(:setup).with('chitter_test')
    set_database_connection
  end
end
