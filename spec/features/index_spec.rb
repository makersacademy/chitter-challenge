require 'spec_helper'

RSpec.feature 'it will display the cheeps' do
  scenario 'so the user can see what cheeps have been posted' do
    Cheeps.create(:username => 'Foo', :message => 'Bar', :timestamp => Time.now)
    visit "/newsfeed"
    click_button('Log-in')
    expect(page).to have_content ('Bar')
  end
end


# CREATE TABLE users (
#     id integer,
#     email varchar(40),
#     password varchar(40),
#     name varchar(40),
#     username varchar(40),
#     PRIMARY KEY(id)
# );
#
# CREATE TABLE cheeps (
#     id     integer,
#     username    varchar(40),
#     message     varchar(140),
#     timestamp   timestamp,
#     PRIMARY KEY(id)
# );
