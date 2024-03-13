CREATE TABLE IF NOT EXISTS
  institutes (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
  );

CREATE TABLE IF NOT EXISTS
  users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password_digest VARCHAR(255) NOT NULL,
    user_type ENUM('mentor', 'student', 'admin') NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    age INT NOT NULL,
    institute_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (institute_id) REFERENCES institutes (id),
    CONSTRAINT atleast_18 CHECK (age >= 18)
  );

CREATE TABLE IF NOT EXISTS
  ratings (
    id INT NOT NULL AUTO_INCREMENT,
    mentor_id INT NOT NULL,
    student_id INT NOT NULL,
    rating INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mentor_id) REFERENCES users (id),
    FOREIGN KEY (student_id) REFERENCES users (id),
    CONSTRAINT rating_positive_less_than_eq_five CHECK (
      rating > 0
      AND rating < 5
    )
  );

CREATE TABLE IF NOT EXISTS
  recommendations (
    id INT NOT NULL AUTO_INCREMENT,
    mentor_id INT NOT NULL,
    student_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mentor_id) REFERENCES users (id),
    FOREIGN KEY (student_id) REFERENCES users (id)
  );
