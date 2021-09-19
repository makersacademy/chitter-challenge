feature 'signin' do
    let(:maker) do
        Maker.create(name: 'Clive Myrie',
                    email: 'Clive.Myrie@bbc.co.uk',
                    username: 'CliveMyrie',
                    password: 'Mastermind21',
                    password_confirmation: 'Mastermind21')
    end

    scenario 'successful signin with correct details' do
        valid_create_account
        signin(username: maker.username, password: maker.password)
        expect(page).to have_content "Hello, #{maker.name}"
    end

    scenario 'unsuccessful sigin with incorrect details' do
        signin(username: maker.username, password: 'password_incorrect')
        expect(page).to have_content "The username and/or password is not recognised"
    end
end