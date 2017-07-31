require_relative 'web_helper'
feature 'Viewing peeps' do

  scenario 'I want to see all the peeps' do
    Peep.create(peep: "Peep 1")
    Peep.create(peep: "Peep 2")
    Peep.create(peep: "Peep 3")
    visit '/messages'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content "Peep 1"
      expect(page).to have_content "Peep 2"
      expect(page).to have_content "Peep 3"
    end
  end

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'I want to see todays date on a tweet I create' do
    sign_in(email: user.email,   password: user.password)
    send_a_peep
      time_and_date = todays_date_toady
      within 'ul#peeps' do
      expect(page).to have_content time_and_date
    end
  end
end
