feature 'displaying peeps in a feed' do
    scenario 'displaying times and dates of each peep' do
        valid_create_account
        post_a_peep_1
        within(:css, "ul#peeps li:eq(1)") do
            expect(page).to have_content "Breaking peep!"
        end
    end
end