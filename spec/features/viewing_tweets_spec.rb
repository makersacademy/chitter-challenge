feature 'Viewing tweets' do
    scenario 'the user will be able to view tweets 'do
        visit('/')
        expect(page).to have_content "tweet tweet"
    end 
end

feature 'Viewing tweets ' do
    scenario ' A user will be able to view tweets ' do
        visit('/tweets')

        expect(page).to have_content "tweet 1"
        expect(page).to have_content "tweet 2"
        expect(page).to have_content "tweet 3"
    end
end
