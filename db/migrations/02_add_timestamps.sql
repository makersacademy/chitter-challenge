ALTER TABLE peeps
ADD COLUMN timestamp TIMESTAMPTZ DEFAULT now();
