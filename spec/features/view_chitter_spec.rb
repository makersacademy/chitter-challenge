require 'pg'
feature 'having access to website' do
	scenario 'signing in' do
        visit '/'
        expect(page).to have_content "Time to get chatting on Chitter"
    end
end
