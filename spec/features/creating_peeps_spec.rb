feature 'Creating peeps' do
  scenario 'I want to create a peep using the datamapper syntax' do
    Peep.create(contents: "Peep123")
    expect(Peep.first.contents).to eq 'Peep123'
  end
end
