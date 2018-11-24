CREATE TABLE peeps("message id" SERIAL PRIMARY KEY,
                   "message created" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                   "message" VARCHAR(1000),
                   "username" VARCHAR(15),
                   "subject" VARCHAR(60)
                  );
