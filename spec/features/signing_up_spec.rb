feature 'signing up for Chitter' do 
    scenario 'submitting sign up details' do
        visit('/')
        expect(page).to have_content "Welcome to Chitter"
    end
end