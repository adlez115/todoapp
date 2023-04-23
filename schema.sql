CREATE DATABASE todo;

USE todo;

CREATE TABLE users(
id int AUTO_INCREMENT PRIMARY KEY,
name varchar(255),
email varchar(255) UNIQUE NOT NULL,
password varchar(255));

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title varchar(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (name, email, password) VALUES ('isaac', 'isaac@hotmail.com', 'hola123');
INSERT INTO users (name, email, password) VALUES ('julian', 'julian@hotmail.com', 'hola123');

INSERT INTO todos (title, user_id) 
VALUES 
("🏃‍♀️ Go for a morning run 🌄", 1),
("💻 Work on project presentation 💼", 1),
("🛒 Go grocery shopping 🛍️", 1),
("📚 Read 30 pages of book 📖", 1),
("🚴‍♂️ Ride bike to the park 🌳", 1),
("🍲 Cook dinner for family 🍴", 1),
("💆‍♂️ Practice yoga 🧘‍♂️", 1),
("🎧 Listen to a podcast 🎤", 1),
("🧹 Clean the house 🧼", 1),
("🛌 Get 8 hours of sleep 💤", 1);

INSERT INTO shared_todos (todo_id, user_id, shared_with_id) VALUES (1, 1, 2);

SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];