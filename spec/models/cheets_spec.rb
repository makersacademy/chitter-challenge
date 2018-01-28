describe Cheets do

  it 'expects Cheets to be incremented by 1' do
    expect { create_cheet }.to change(Cheets, :count)
  end
end
