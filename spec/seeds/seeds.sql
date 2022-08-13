TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (email, password) VALUES ('duck@makers.com', 'quack!');
INSERT INTO users (email, password)
  VALUES ('duck2@makers.com', '$2a$12$qmO3XbZHMXhymqZBstr48O0rW8ubyqAITgm9T.cIoQrk0CMEEfECm');
INSERT INTO users (email, password, name, username)
  VALUES ('homer@simpsons.com', '$2a$12$GKyE/JG3VsUfVeaPzfoNu.4U2DLkXo9uPbq1/K2MohAgAC2Qw4sTm','Homer Simpson',	'@homer');

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('It is awfully hot today', '2022-08-12 21:55:12.940137 +0100', 'Daffy Duck', '@daffy');
INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('Nice weather for ducks', '2022-08-12 21:56:54.385627 +0100', 'Donald Duck', '@donald');
