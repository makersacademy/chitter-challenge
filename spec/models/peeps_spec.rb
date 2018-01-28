describe Peeps do

  it 'expects peeps to be incremented by 1' do
    expect { create_peep }.to change(Peeps, :count)
  end
end
