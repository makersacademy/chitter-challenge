describe Cheets do

  let!(:cheet) do
    Cheet.create(user: 'test@test.com',
                ,message: 'my first cheet')
  end

  expect { sign_up }.to change(User, :count)

end
