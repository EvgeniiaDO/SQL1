
CREATE table IF NOT EXISTS Genre (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT exists Artist (
    ArtistID SERIAL PRIMARY KEY,
    Nickname VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT exists Album (
    AlbumID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Year INT check (year>1900) NOT NULL
);

CREATE TABLE IF NOT exists Track (
    TrackID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Duration interval check (Duration<='23:59:59') NOT NULL,
    AlbumID INTEGER NOT NULL REFERENCES Album(AlbumID) ON DELETE CASCADE
);

CREATE TABLE IF NOT exists Collection (
   CollectionID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Year INT check (year>1900) NOT NULL
);



CREATE TABLE IF NOT exists TrackCollection (
    TrackID INT,
    CollectionID INT,
    PRIMARY KEY (TrackID, CollectionID),
    CONSTRAINT fk_Track FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE,
    CONSTRAINT fk_Collection FOREIGN KEY (CollectionID) REFERENCES Collection(CollectionID) ON DELETE CASCADE
);

CREATE TABLE IF NOT exists ArtistGenre (
    ArtistID INT,
    GenreID INT,
    PRIMARY KEY (ArtistID, GenreID),
    CONSTRAINT fk_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE CASCADE,
    CONSTRAINT fk_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) ON DELETE CASCADE
);

CREATE TABLE IF NOT exists AlbumArtist (
   AlbumID INT,
    ArtistID INT,
    PRIMARY KEY (AlbumID, ArtistID),
    CONSTRAINT fk_Album FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID) ON DELETE CASCADE,
    CONSTRAINT fk_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE CASCADE
);