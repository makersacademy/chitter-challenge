require "tag_repository"
require "user"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe TagRepository do
  before :each do
    reset_tables
  end

  let(:repo) { TagRepository.new }
  let(:user_4) {
    user = User.new
    user.id = 4
    user.name = "Alan Turing"
    user.username = "universal_turing_machine"
    user.email = "alan@bletchley_park.mod"
    user.password = "engima"
    user
  }

  let(:user_5) {
    user = User.new
    user.id = 5
    user.name = "Grace Hopper"
    user.username = "ghopper"
    user.email = "debugger@mail.com"
    user.password = "COBOL"
    user
  }

  it "returns all tags" do
    all_tags = repo.all
    expect(all_tags.length).to eq 3
    expect(all_tags.last.user_id).to eq 3
    expect(all_tags.last.peep_id).to eq 2
    expect(all_tags[1].user_id).to eq 3
  end

  it "adds a tag to the DB" do
    tag = Tag.new
    tag.peep_id = 3
    tag.user_id = 1
    repo.add(tag)
    all_tags = repo.all
    expect(all_tags.length).to eq 4
    expect(all_tags.last.user_id).to eq 1
    expect(all_tags.last.peep_id).to eq 3
    expect(all_tags[1].user_id).to eq 3
  end

  it "finds a single tag within a message and returns the user ID" do
    message = "Hello @tcarmichael"
    result = repo.check_message_for_tags(message)
    expect(result).to be_an_instance_of(Array)
    expect(result.length).to eq(1)
    expect(result.first).to be_an_instance_of(User)
    expect(result.first.email).to eq("tomcarmichael@hotmail.co.uk")
    expect(result.first.id).to eq(1)
  end

  it "finds two tags within a message and returns the user IDs" do
    message = "Hello @tcarmichael check out the photos from @wsmith!"
    result = repo.check_message_for_tags(message)
    expect(result).to be_an_instance_of(Array)
    expect(result.length).to eq(2)
    expect(result.first.email).to eq("tomcarmichael@hotmail.co.uk")
    expect(result.first.id).to eq(1)
    expect(result.last.email).to eq("orwell.george@aol.com")
    expect(result.last.id).to eq(3)
  end
  it "returns nil if we check a message for tags which has none" do
    message = "Hello world"
    result = repo.check_message_for_tags(message)
    expect(result).to eq nil
  end
  it "returns nil if we check a message for tags which dont match a suer" do
    message = "Hello @world!"
    result = repo.check_message_for_tags(message)
    expect(result).to eq nil
  end
  context "when adding the tags for a peep to the DB" do
    it "adds the only tag specified" do
      UserRepository.new.register(user_4.username, user_4.name, user_4.email, user_4.password)
      repo.add_tags_by_peep([user_4], 1)
      all_tags = repo.all
      expect(all_tags.length).to eq 4
      expect(all_tags.last.user_id).to eq 4
      expect(all_tags.last.peep_id).to eq 1
    end
    it "adds multiple tags" do
      UserRepository.new.register(user_4.username, user_4.name, user_4.email, user_4.password)
      UserRepository.new.register(user_5.username, user_5.name, user_5.email, user_5.password)
      repo.add_tags_by_peep([user_4, user_5], 1)
      all_tags = repo.all
      expect(all_tags.length).to eq 5
      expect(all_tags.last.peep_id).to eq 1
      expect(all_tags[-2].user_id).to eq 4
      expect(all_tags.last.user_id).to eq 5
    end
  end
end
