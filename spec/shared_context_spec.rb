require "database_connection"

shared_context "doubles setup" do

  def reset_users_table
    seed_sql = File.read('spec/users_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  def reset_peeps_table
    seed_sql = File.read('spec/peeps_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  let(:user1) do 
    double(:User, {
      fullname: "Chang Huynh", 
      username: "changwynn", 
      email: "huynchang@gmail.com", 
      password: "passworD+123",
      peeps: :peep1
    })
  end

  let(:new_user) do 
    double(:User, {
      fullname: "John Wick", 
      username: "wickedman", 
      email: "imsowicked@gmail.com", 
      password: "w1ck3d+",
      peeps: :new_peep
    })
  end
end
