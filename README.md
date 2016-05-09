Chitter Challenge
=================

A Twitter clone, with users and 'peeps'. Each user has many peeps, and each peep belongs to one user.

Missing functionality:

- Encrypted password:
  Plan is to write a helper which calls on Bcrypt to hash the password, including a cryptographically secure random number generator e.g. SecureRandom. Make a call to this method when storing password at user registration.
  Salt will be stored in user database.

- Signing in:
  When password is submitted controller would grab salt from user database and call same Hash method, then compare hashes to authenticate.
  Username and name would be stored in a session and called for each new peep.

- Include username and name in peeps:
  Current user details would be stored in session, and called when creating a new peep.

- Signing out:
  This would clear the session.

- Listing peeps in reverse chronological order:
  At peep creation pass in a timestamp and modify the 'peeps' view to sort `Peeps.all` by timestamp.

