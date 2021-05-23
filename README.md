# Chitter

Chitter is a barebones Twitter clone. A user can sign up, sign in and post peeps. All peeps are visible to all users, even if not signed in.

Chitter uses Ruby, Sinatra, PostgreSQL and BCrypt.

## Features I didn't have time to add

- Peeps show name and username of author
- Username and email address of users are unique
- Email notification if tagged in a peep
- Reply to peeps
- Nice CSS

## User stories

> As a Maker, so that I can let people know what I am doing, I want to post a message (peep) to chitter

> As a Maker, so that I can see what others are saying, I want to see all peeps in reverse chronological order

> As a Maker, so that I can better appreciate the context of a peep, I want to see the time at which it was made

> As a Maker, so that I can post messages on Chitter as me, I want to sign up for Chitter

> As a Maker, so that only I can post messages on Chitter as me, I want to log in to Chitter

> As a Maker,s o that I can avoid others posting messages on Chitter as me, I want to log out of Chitter

## Installation

```bash
git clone https://github.com/rdupplaw/chitter-challenge.git
cd chitter-challenge
bundle
```

## Database setup

1. Open `psql`
2. Create `chitter` and `chitter_test` databases
3. Run the query in `db/migrations/01_create_peeps_table.sql` in both databases
4. Run the query in `db/migrations/02_add_posted_column.sql` in both databases
5. Run the query in `db/migrations/03_create_users_table.sql` in both databases

## Usage

```bash
rackup
```

## Testing

```
rspec
```