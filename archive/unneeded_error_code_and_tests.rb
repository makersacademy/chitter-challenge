
class UserRepository

  def create(user)
    # # Raises error if any fields are empty
    # raise "Please fill in all fields" if user.email_address == "" || user.password == "" || user.name == "" || user.username == ""
    
    # # Raises error if email address or username is already taken
    # repo = UserRepository.new
    # users = repo.all
    # users.each do |existing_user|
    #   raise "That email address is already taken" if user.email_address == existing_user.email_address
    #   raise "That username is already taken" if user.username == existing_user.username
    # end
  end

  def find_user_by_id(user_id)
    # # Raises error if there is no user with given id
    # repo = UserRepository.new
    # users = repo.all
    # invalid_user = true
    # users.each do |existing_user|
    #   invalid_user = false if user_id.to_s == existing_user.id
    # end
    # raise "No user exists at this address" if invalid_user == true
  end
end

RSpec.describe UserRepository do

  describe "#create(user)" do
    xit "raises error when a field is empty" do
      new_user = User.new
      new_user.email_address = 'newuser@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = ''
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('Please fill in all fields')
    end

    xit "raises error when email_address is already taken" do
      new_user = User.new
      new_user.email_address = 'sarahjacobs@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = 'new_username'
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('That email address is already taken')
    end

    xit "raises error when username is already taken" do
      new_user = User.new
      new_user.email_address = 'newuser@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = 'JJ22'
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('That username is already taken')
    end
  end


  describe "#find_user_by_id(user_id)" do
    xit "raises an error if user doesn't exist" do
      repo = UserRepository.new
      expect{ repo.find_user_by_id(100) }.to raise_error ("No user exists at this address")
    end
  end
end






class PeepRepository
  def peeps_by_user(id_of_user)
    # # Check if user_id exists, raise error if it doesn't
    # result_set_1 = DatabaseConnection.exec_params("SELECT user_id FROM peeps", [])
    
    # existing_user_ids = []

    # result_set_1.each do |record|
    #   user_id = record["user_id"]
    #   existing_user_ids << user_id
    # end

    # raise "This user does not exist" if !existing_user_ids.include?(id_of_user.to_s)
  end

  # find one peep by its id
  # takes one argument: peep_id
  def find_peep_by_id(id_of_peep)
    # # check if peep exists
    # result_set_1 = DatabaseConnection.exec_params("SELECT id FROM peeps", [])
    
    # existing_peep_ids = []

    # result_set_1.each do |record|
    #   peep_id = record["id"]
    #   existing_peep_ids << peep_id
    # end

    # raise "No peeps exist at that address" if !existing_peep_ids.include?(id_of_peep.to_s)

  def create(peep)
    # # Executes the SQL query:
    # raise "Peeps must be at least 1 character long" if peep.content == ""
  end
end

RSpec.describe PeepRepository do
  describe "#peeps_by_user(id_of_user)" do
    xit "raises error when non-existent user_id is given" do
      repo = PeepRepository.new
      expect{ repo.peeps_by_user(70) }.to raise_error ("This user does not exist")
    end
  end

  describe "#find_peep_by_id(id_of_peep)" do
    xit "raises error if peep_id doesn't exist" do
      repo = PeepRepository.new
      expect{ repo.find_peep_by_id(100) }.to raise_error ("No peeps exist at that address")
    end
  end

  describe "#create(peep)" do
    xit "raises error when content is an empty string" do
      new_peep = Peep.new
      new_peep.content = ''
      new_peep.date_and_time = '2022-12-01 19:43:11'
      new_peep.user_id = 3
      
      repo = PeepRepository.new
      expect{ repo.create(new_peep) }.to raise_error("Peeps must be at least 1 character long")
    end
  end
end






class CommentRepository

  def comments_by_peep(id_of_peep)
    # # Check if peep_id exists, raise error if it doesn't
    # result_set_1 = DatabaseConnection.exec_params("SELECT id FROM peeps", [])

    # existing_peep_ids = []

    # result_set_1.each do |record|
    #   peep_id = record["id"]
    #   existing_peep_ids << peep_id
    # end
  end

  def create(comment)
    # raise "Comments must be at least 1 character long" if comment.content == ""
  end

RSpec.describe CommentRepository do

  describe "#comments_by_peep(id_of_peep)" do
    it "raises error if given non-existent peep id" do
      repo = CommentRepository.new
      expect{ repo.comments_by_peep(95) }.to raise_error("There is no peep at this address")
    end
  end

  describe "#create(comment)" do
    it "raises error if comment is an empty string" do
      new_comment = Comment.new
      new_comment.content = ''
      new_comment.date_and_time = '2022-12-01 20:40:14'
      new_comment.user_id = 3
      new_comment.peep_id = 5
      
      repo = CommentRepository.new
      expect{ repo.create(new_comment) }.to raise_error ("Comments must be at least 1 character long")
    end
  end
end