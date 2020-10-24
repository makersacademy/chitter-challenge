describe Chitter do
  it 'responds to .all by returning all chitter messages' do
    expect(Chitter.all).to eq ["this is the first message ever posted to chitter", "this is the second", "okay now i've posted three"]
  end
end