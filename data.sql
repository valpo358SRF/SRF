CREATE TABLE experiments (
    experiment_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL
);


CREATE TABLE summaries (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    experiment_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    img_url VARCHAR(25)
);

ALTER TABLE summaries ADD CONSTRAINT summary_fk_experiment
FOREIGN KEY (experiment_id)
REFERENCES experiments (experiment_id);


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    is_admin TINYINT DEFAULT 0
);


CREATE TABLE recipients (
    recipient_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    opted_in TINYINT DEFAULT 1
);
