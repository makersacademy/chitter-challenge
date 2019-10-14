feature 'displays all peeps' do
    scenario 'user can see all peeps in reverse order' do
        id = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test') RETURNING id;").first['id']
        DatabaseConnection.query("INSERT INTO peeps (message, tdz, user_id) VALUES ('1st Test Peep', '#{Time.now - 30*60}', '#{id}') RETURNING *;").first
        DatabaseConnection.query("INSERT INTO peeps (message, tdz, user_id) VALUES ('2nd Test Peep', '#{Time.now}', '#{id}') RETURNING *;").first
        visit('/')
        expect(page) =~ (/2nd Test Peep.*1st Test Peep/)
    end
end