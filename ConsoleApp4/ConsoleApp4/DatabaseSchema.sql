

PRAGMA foreign_keys = ON;


CREATE TABLE Performers (
                            Id INTEGER PRIMARY KEY AUTOINCREMENT,
                            Nickname TEXT NOT NULL,
                            RegistrationDate TEXT NOT NULL
);


CREATE TABLE PersonalFiles (
                               Id INTEGER PRIMARY KEY AUTOINCREMENT,
                               PerformerId INTEGER UNIQUE NOT NULL,
                               PassportData TEXT NOT NULL,
                               Address TEXT NOT NULL,
                               FOREIGN KEY (PerformerId) REFERENCES Performers(Id)
);


CREATE TABLE Projects (
                          Id INTEGER PRIMARY KEY AUTOINCREMENT,
                          Name TEXT NOT NULL,
                          Deadline TEXT NOT NULL
);


CREATE TABLE ProjectParticipants (
                                     ProjectId INTEGER NOT NULL,
                                     PerformerId INTEGER NOT NULL,
                                     Role TEXT NOT NULL,
                                     PRIMARY KEY (ProjectId, PerformerId),
                                     FOREIGN KEY (ProjectId) REFERENCES Projects(Id),
                                     FOREIGN KEY (PerformerId) REFERENCES Performers(Id)
);


INSERT INTO Performers (Nickname, RegistrationDate) VALUES
                                                        ('ArtistOne', '2023-01-15'),
                                                        ('CreativeMind', '2023-02-20'),
                                                        ('DreamMaker', '2023-03-10');

INSERT INTO PersonalFiles (PerformerId, PassportData, Address) VALUES
                                                                   (1, 'Паспорт 1234 567890', 'г. Москва, ул. Ленина, д. 1'),
                                                                   (2, 'Паспорт 4321 098765', 'г. Санкт-Петербург, пр. Невский, д. 25'),
                                                                   (3, 'Паспорт 5555 666777', 'г. Казань, ул. Баумана, д. 15');

INSERT INTO Projects (Name, Deadline) VALUES
                                          ('Кинопроект "Восход"', '2023-12-31'),
                                          ('Музыкальный альбом "Звуки ночи"', '2023-11-15');


INSERT INTO ProjectParticipants (ProjectId, PerformerId, Role) VALUES
                                                                   (1, 1, 'Ведущий'),
                                                                   (1, 2, 'Монтажёр'),
                                                                   (1, 3, 'Сценарист'),
                                                                   (2, 1, 'Композитор'),
                                                                   (2, 2, 'Звукорежиссёр');
