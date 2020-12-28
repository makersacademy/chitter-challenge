require_relative '../helpers.rb'

include Helpers

feature 'adding and viewing peeps' do
  before(:each) do
    @user = instance_double("Book",
        :email => 'test@example.com',
        :password => 'password123',
        :name => 'rubberduck'
      )
    maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')
  end

  scenario 'A user can add and see peeps' do
    peep = instance_double("Peep", :message_content => "Test peep content")
    sign_in(@user)

    add_peep(peep)

    expect(current_path).to eq '/peeps/list'
    expect(page).to have_content "Test peep content"
  end

  scenario 'A user can see peeps in chronoligal order' do

      peep = instance_double("Peep", :message_content => "First Peep")
      peep2 = instance_double("Peep", :message_content => "Second Peep")
      sign_in(@user)

      add_peep(peep)

      click_button('Back to main page')

      add_peep(peep2)

      expect("Second Peep").to appear_before("First Peep")
  end

  scenario 'A user can add and see author of the peep' do
    peep = instance_double("Peep", :message_content => "Test peep content")

    sign_in(@user)

    add_peep(peep)

    expect(current_path).to eq '/peeps/list'
    expect(page).to have_content "Test peep content"
    expect(page).to have_content "by rubberduck"
  end
end
