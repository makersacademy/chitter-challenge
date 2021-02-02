feature 'Show a list of peeps' do
    scenario ', most recent post first' do
        Peep.post(message: 'Feature test peep')
        visit '/peeps'
        expect(page).to have_content 'Feature test peep'
    end

    scenario ', including the date and time of the post' do
        Peep.post(message: 'Feature test peep')
        visit '/peeps'
        expect(page).to have_content Time.now.strftime("%Y-%m-%d")
    end
end