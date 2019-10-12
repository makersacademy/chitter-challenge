feature 'displays all peeps' do
    scenario 'user can see all peeps in reverse order' do
        DatabaseConnection.query("INSERT INTO peeps (message, tdz) VALUES ('1st Test Peep', '#{Time.now - 30*60}') RETURNING *;").first
        DatabaseConnection.query("INSERT INTO peeps (message, tdz) VALUES ('2nd Test Peep', '#{Time.now}') RETURNING *;").first
        visit('/')
        expect(page) =~ (/2nd Test Peep.*1st Test Peep/)
    end
end