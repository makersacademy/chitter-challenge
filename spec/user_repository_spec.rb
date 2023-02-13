require_relative '../models/user'
require_relative '../repositories/user_repository'

def reset_tables
  seed_sql = File.read('db/seeds.sql')
  connection = PG.connect({ host: 'localhost', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  describe "#all" do
    it "returns all records" do
      repo = UserRepository.new

      expected = [
        have_attributes(
          id: 1,
          email: 'alice@makersacademy.com',
          password: '$2a$12$5/u2wF0CJwS4FvE5fF7lXeJnTlylSmfEQUmxAjgJ5F62n8GqBUxUq',
          name: 'Alice',
          username: 'aliceinwonderland'
        ),
        have_attributes(
          id: 2,
          email: 'bob@makersacademy.com',
          password: '$2a$12$wWYnwD0ji3Xr7PFAkY7zxOAfoHCMU9MPc./bLvZCjBvES3TlI6tgW',
          name: 'Bob',
          username: 'bobthebuilder'
        ),
        have_attributes(
          id: 3,
          email: 'carol@makersacademy.com',
          password: '$2a$12$grGbWj5HFH9lk7PmQtbMYeyZyfnJQ9t7f8dNqGSL3zeKlZiRrVXSW',
          name: 'Carol',
          username: 'carolsinging'
        )
      ]

      expect(repo.all).to match_array(expected)
    end
  end

  describe "#find" do
    it 'returns matching record by id' do
      repo = UserRepository.new

      expected = have_attributes(
        id: 2,
        email: 'bob@makersacademy.com',
        password: '$2a$12$wWYnwD0ji3Xr7PFAkY7zxOAfoHCMU9MPc./bLvZCjBvES3TlI6tgW',
        name: 'Bob',
        username: 'bobthebuilder'
      )

      expect(repo.find("id", 2)).to match(expected)
    end

    it 'returns matching record by username' do
      repo = UserRepository.new

      expected = have_attributes(
        id: 2,
        email: 'bob@makersacademy.com',
        password: '$2a$12$wWYnwD0ji3Xr7PFAkY7zxOAfoHCMU9MPc./bLvZCjBvES3TlI6tgW',
        name: 'Bob',
        username: 'bobthebuilder'
      )

      expect(repo.find('username', 'bobthebuilder')).to match(expected)
    end

    it 'returns matching record by email' do
      repo = UserRepository.new

      expected = have_attributes(
        id: 2,
        email: 'bob@makersacademy.com',
        password: '$2a$12$wWYnwD0ji3Xr7PFAkY7zxOAfoHCMU9MPc./bLvZCjBvES3TlI6tgW',
        name: 'Bob',
        username: 'bobthebuilder'
      )

      expect(repo.find('email', 'bob@makersacademy.com')).to match(expected)
    end

  end

  describe "#create" do
    it "creates a record" do
      repo = UserRepository.new
      new_user = User.new(
        email: 'test@makersacademy.com',
        password: 'testpassword',
        name: 'testname',
        username: 'testuser'
      )

      repo.create(new_user)

      expected = have_attributes(new_user.to_h.except(:id))

      expect(repo.all).to include(expected)
    end
  end
end
