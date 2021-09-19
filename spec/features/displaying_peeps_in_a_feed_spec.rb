feature 'displaying peeps in a feed' do
    scenario 'display the most recent peep at the top' do
        valid_create_account
        post_a_peep_1; post_a_peep_2; post_a_peep_3
        within(:css, "ul#peeps li:eq(1)") do
            expect(page).to have_content "Create a Chitter account"
        end
        within(:css, "ul#peeps li:eq(2)") do
            expect(page).to have_content "Join the Chitter debate"
        end
        within(:css, "ul#peeps li:eq(3)") do
            expect(page).to have_content "The Chitter debate is now alive and kicking! Abusive peeps will not be tolerated!"
        end
    end
end