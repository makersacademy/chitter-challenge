require './app/models/peep'

describe Peep do

  let!(:peep) do

    Peep.create(title: 'title_test',
      content: 'content_test')
  end

  it 'peep stores a title to the database' do
    expect(peep.title).to eq "title_test"
  end

  it 'peep stores content to the database' do
    expect(peep.content).to eq "content_test"
  end
end
