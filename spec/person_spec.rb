require 'person.rb'

describe Person do

  describe '.all' do
    it 'returns a list of people' do
   connection = PG.connect(dbname: 'chitter_test')

   # Add the test data
   person = Person.create(name: "Kaja", username: "KajaPol",email: "kaja.polkowska@gmail.com", password: "cat")
   Person.create(name: "Jon", username: "Snow",email: "jon.polkowska@gmail.com", password: "dog")
   Person.create(name: "Sam", username: "Hello",email: "sam.polkowska@gmail.com", password: "sam")

   people = Person.all

   # expect(people.length).to eq 4
   expect(people.first).to be_a Person
   # expect(people.first.id).to eq person.id
   expect(people.first.name).to eq 'Kaja'
   expect(people.first.email).to eq 'kaja.polkowska@gmail.com'
  end
end
end
