# Chitter

## User stories

> As a Maker, so that I can let people know what I am doing, I want to post a message (peep) to chitter

> As a Maker, so that I can see what others are saying, I want to see all peeps in reverse chronological order

> As a Maker, so that I can better appreciate the context of a peep, I want to see the time at which it was made

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

## Usage

```bash
rackup
```