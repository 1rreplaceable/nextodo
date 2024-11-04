-- User table
CREATE TABLE User (
                      UserId SERIAL PRIMARY KEY,
                      Username VARCHAR(50) NOT NULL UNIQUE,
                      Password VARCHAR(255) NOT NULL,
                      Nickname VARCHAR(50) NOT NULL UNIQUE
);

-- Friend table
CREATE TABLE Friend (
                        UserId INT NOT NULL,
                        FriendUserId INT NOT NULL,
                        PRIMARY KEY (UserId, FriendUserId),
                        FOREIGN KEY (UserId) REFERENCES User(UserId) ON DELETE CASCADE,
                        FOREIGN KEY (FriendUserId) REFERENCES User(UserId) ON DELETE CASCADE
);

-- ToDo table
CREATE TABLE ToDo (
                      ToDoNum SERIAL PRIMARY KEY,
                      UserId INT NOT NULL,
                      Completed BOOLEAN NOT NULL DEFAULT FALSE,
                      Title VARCHAR(100) NOT NULL,
                      Priority VARCHAR(20),
                      StartDate DATE,
                      EndDate DATE,
                      FOREIGN KEY (UserId) REFERENCES User(UserId) ON DELETE CASCADE
);

-- Comment table
CREATE TABLE Comment (
                         CommentId SERIAL PRIMARY KEY,
                         ToDoNum INT NOT NULL,
                         Text TEXT NOT NULL,
                         AuthorId INT NOT NULL,
                         FOREIGN KEY (ToDoNum) REFERENCES ToDo(ToDoNum) ON DELETE CASCADE,
                         FOREIGN KEY (AuthorId) REFERENCES User(UserId) ON DELETE CASCADE
);
