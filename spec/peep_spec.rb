require 'peep'
require 'user'
require 'database_helpers'

describe '.all' do
 it 'returns a list of peep messages' do
   #connect to test database
   con = PG.connect(dbname: 'chitter_test')

   #add test data
   # con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
   Peep.add(peep: 'Makers is the best', account: 'Makers')
   peep = Peep.add(peep: 'Makers is great', account: 'Makers')

   # list = Peep.all
   # expect(list).to include('Makers is great')

   peeps = Peep.all
   expect(peeps.length).to eq 2
   expect(peeps.first).to be_a Peep
   expect(peeps.first.id).to eq peep.id
   expect(peeps.first.peep).to eq 'Makers is great'
   expect(peeps.first.account).to eq 'Makers'
 end
end

describe '.add' do
  it 'adds a new peep message' do
    peep = Peep.add(peep: 'Makers is great', account: 'Makers')
    persisted_data = persisted_data(id: peep.id)

    # expect(bookmark['url']).to eq 'http://www.testbookmark.com'
    # expect(bookmark['title']).to eq 'Test Bookmark'
    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.peep).to eq 'Makers is great'
    expect(peep.account).to eq 'Makers'
  end
  # it 'does not create a new bookmark if the URL is not valid' do
  #   Bookmark.add(url: 'Not a real bookmark', title: 'Not a real bookmark')
  #   expect(Bookmark.all).to be_empty
  # end
end

describe '.delete' do
  it 'deletes a selected peep' do
    peep = Peep.add(peep: 'Makers is great', account: 'Makers')
    Peep.delete(id: peep.id)
    expect(Peep.all.length).to eq 0
  end
end

describe '.update' do
  it 'updates a posted peep with new details' do
    peep = Peep.add(peep: 'Makers is great', account: 'Makers')
    updated_peep = Peep.update(id: peep.id, peep: 'Makers is the best!')

    expect(updated_peep).to be_a Peep
    expect(updated_peep.id).to eq peep.id
    expect(updated_peep.peep).to eq 'Makers is the best!'
  end
end

describe '#replies' do
  it 'shows a list of replies on the main peep message' do
    peep = Peep.add(peep: 'Makers is great', account: 'Makers')
    DatabaseConnection.query("INSERT INTO replies (id, reply, peep_id) VALUES(1, 'Test reply', #{peep.id})")

    reply = peep.replies.first

    expect(reply['reply']).to eq 'Test reply'
  end
end
