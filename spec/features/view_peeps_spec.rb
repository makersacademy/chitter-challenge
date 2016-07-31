require 'spec_helper'
feature 'user can see all the peeps' do
  let!(:user) do
    User.create(email: 'becca@becca.com',
                name: 'Becca',
                username: 'pregnantwombat',
                password: 'haircut',
                password_confirmation: 'haircut')
  end

  before { Timecop.freeze(Time.now) }

  scenario 'user can see all the peeps in peep list' do
    sign_in
    write_peep
    expect(page).to have_content "feast your peepers on this"
  end
  scenario 'user can see all who posted the peeps' do
    sign_in
    write_peep
    expect(page).to have_content "pregnantwombat"
  end
  scenario 'user can see all who posted the peeps' do
    sign_in
    write_peep
    expect(page).to have_content(Time.now.strftime("on %a at %I:%M%p"))
  end
end
