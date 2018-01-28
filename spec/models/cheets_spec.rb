describe Cheets do
  # let!(:cheet) do
  #   Cheets.create(user: 'test@test.com',
  #                message: 'my first cheet')
  # end
  it 'expects Cheets to be incremented by 1' do
    expect { Cheets.create(user: 'test@test.com',
             message: 'my first cheet')
    }.to change(Cheets, :count)
  end
end
