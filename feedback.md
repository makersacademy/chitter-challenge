- Good README file. I knew how to use the app and what to expect. This could have been extended to include forking the repo, running bundle install and information on how to set up the databases.

- Controller is skinny with minimal logic

- I like that you have a separate class for the DatabaseConnection.

- Good that you encrypted the password.

- Really good unit and feature tests, especially for database class, very comprehensive. You could have before do statements at the beginning of your unit tests to avoid some of the repetition in the specs eg. signing in. The user spec was missing a test for self.details, this method may have been able to be made private alternatively.

- Ideally use doubles in tests.

- Folders are neat and nicely laid sign_out

- To extend this you could implement a feature to ensure that usernames and emails are unique. You could also format the times on the posts so that you don't get the full time to the second (e.g. use Time.now)   
