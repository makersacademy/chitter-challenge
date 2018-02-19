require 'peep'

describe Peep do

  before(:each) do
    # @link = Link.create(url: 'http://www.testlink.com', title: 'Test Link')
    DatabaseConnection.query("INSERT INTO users(author) VALUES ('Kitten')")
    # DatabaseConnection.query("INSERT INTO peeps(peep) VALUES ('meow')")
    # DatabaseConnection.query("INSERT INTO peeps(id, user_id) VALUES
    #                             (1, (SELECT id FROM users WHERE author= 'Kitten') ),
    #                             ( 'another row', SELECT id from foo WHERE type='red'  );")
    DatabaseConnection.query("INSERT into peeps (peep, user_id) values ('meow', LASTVAL())")
    DatabaseConnection.query("INSERT INTO users(author) VALUES ('Puppy')")
    DatabaseConnection.query("INSERT into peeps (peep, user_id) values ('woof', LASTVAL())")
    DatabaseConnection.query("INSERT INTO users(author) VALUES ('Kitten')")
    DatabaseConnection.query("INSERT into peeps (peep, user_id) values ('meow', LASTVAL())")


# INSERT INTO peeps(name_student, id_teacher_fk)
# SELECT 'Kitty', id
#   FROM TAB_TEACHER
#  WHERE name_teacher = 'Professor Jack'
#  LIMIT 1

    # INSERT INTO bar (description, foo_id) VALUES
    #     ( 'testing',     (SELECT id from foo WHERE type='blue') ),
    #     ( 'another row', (SELECT id from foo WHERE type='red' ) );
    # connection.prepare('insert user into user table', "INSERT INTO users(author) VALUES ($1)")
    # connection.exec_prepared('insert user into user table',[user])
  end

  describe '.all' do
    it "returns all peeps" do
      # db =
      peeps = Peep.all
      expect(peeps).to include 'meow'
    end
  end

  # describe '.add' do
  #   it "adds a new peep to the database" do
  #     Peep.add('', peep)
  #     expect(Peep.all).to include
  #   end
  # end


  # describe '.all' do
  #   it "returns all peeps wrapped in a peep instance" do
  #     peeps = Peep.all
  #
  #     messages = peeps.map(&:peep)
  #
  #     expect(messages).to include('third peep')
  #   end
  # end
end
