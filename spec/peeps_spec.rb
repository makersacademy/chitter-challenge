require 'peeps'

describe '.all' do
  before(:each) do
    @time = Time.new
    @formatted_time = @time.strftime("%A, %B %e, %Y, %k:%M")
    allow(Time).to receive(:new) {@time}
  end

  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peeps.create(comment: 'Steak and eggs is the breakfast of champions!')
    Peeps.create(comment: 'Dwayne Johnson does it again....')
    Peeps.create(comment: 'Steve Buscemi has an odd autograph')
    Peeps.create(comment: 'Set them free!')

    peeps = Peeps.all

    expect(peeps.length).to eq 4
    expect(peeps.first).to be_a Peeps
    expect(peeps.first.comment).to eq 'Steak and eggs is the breakfast of champions!'
    expect(peeps.first.created_at).to eq @formatted_time
  end
end

describe '.create' do
  before(:each) do
    @time = Time.new
    @formatted_time = @time.strftime("%A, %B %e, %Y, %k:%M")
    allow(Time).to receive(:new) {@time}
  end
  
  it 'creates a new peep' do
    new_peep = Peeps.create(comment: 'Best film? Mad Max... Mic drop!')

    expect(new_peep[0]['comment']).to eq('Best film? Mad Max... Mic drop!')
    expect(new_peep[0]['created_at']).to eq @formatted_time
  end
end
