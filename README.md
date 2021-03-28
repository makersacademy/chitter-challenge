# Chitter

![chitter](docs/chitter.png)

---------
### Functions

1. Sign up. Prevent register the same email or username twice, with error message in red.

2. Sign in. Reject wrong email or password, with error message in red.

3. View messages without the need to sign in. Messages are listed from latest to oldest.

4. Can post message after sign in. 

5. Can send email to tagged user

---------
### How to use/test

1. [Setup](docs/setup.md)
2. Run command `rackup`
3. In web browser, enter i.e. "localhost:9292" (or the port provided from previous step)
4. Sign up a few users (some with your real email addresses, best with gmail), play around to register same email and username twice to see the error messages
5. Sign out
6. Sign in with registered users, play around with wrong email or password
7. Chit a few messages, latest will appear at the top
8. Chit messages with @username (replace username with real usernames registered), choose the ones with real email addresses. You should receive email notifications (check junk if not)

*Tried with hotmail, seems not getting the notification. With gmail, getting it straightaway in junk folder.*

---------
### Infrastructure

- Web Framework: Sinatra
- Test Framework: Capybara, rspec
- Database: PostgreSQL

---------
### Overview

- Covered all functions, test coverage 100%
- Responsive web pages (scale up/down when resize browser window)
- Styling
- Deal with apostrophes in text fields before passing to database

---------
### Issues and Future Scope

- Found out how to test emails sending successfully or not
- Add more functions: i.e. reply messages
- Use database on the cloud
- Host site on the cloud