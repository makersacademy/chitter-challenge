require './app/models/peep.rb'

xdescribe Peep do
  it 'store the peep in database' do
    peep = Peep.create(content: 'blablabla!')
    expect { peep }.to change { Peep.all.length }.by(1)
  end
end
