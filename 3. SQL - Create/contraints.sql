/*
 ---------------------------------------
    Gestion de ligues sportives
 ---------------------------------------
    Création des tables et contraintes
 ---------------------------------------
    Nicolas Crausaz & Maxime Scharwath
    Version 2 - 13.11.2020
 ---------------------------------------
 */

--CREATE DATABASE bdr_proj_crausaz_scharwath;

CREATE SCHEMA leagues_manager;

set search_path to leagues_manager;

CREATE TABLE sport
(
    id   integer PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE season
(
    id      integer PRIMARY KEY,
    name    varchar(15) NOT NULL,
    startAt date        NOT NULL,
    endAt   date        NOT NULL
);

CREATE TABLE league
(
    id     integer PRIMARY KEY,
    level  varchar(50) NOT NULL,
    gender char        NOT NULL
);

CREATE TABLE championship
(
    id       integer PRIMARY KEY,
    name     varchar(30) NOT NULL,
    startAt  date        NOT NULL,
    endAt    date        NOT NULL,
    seasonId integer     NOT NULL,
    leagueId integer     NOT NULL,

    CONSTRAINT fk_seasonId FOREIGN KEY (seasonId) REFERENCES season (id),
    CONSTRAINT fk_leagueId FOREIGN KEY (leagueId) REFERENCES league (id)
);

CREATE TABLE federation
(
    id      integer PRIMARY KEY,
    name    varchar(100) NOT NULL,
    sportId integer      NOT NULL,

    CONSTRAINT fk_sportId FOREIGN KEY (sportId) REFERENCES sport (id)
);

CREATE TABLE player
(
    uid       uuid PRIMARY KEY,
    lastname  varchar(255) NOT NULL,
    firstname varchar(255) NOT NULL,
    birthdate date         NOT NULL
);

CREATE TABLE federation_licence_player
(
    licenceNumber varchar(255) NOT NULL,
    playerUid     uuid,
    federationId  integer,

    PRIMARY KEY (playerUid, federationId),

    CONSTRAINT fk_playerUid FOREIGN KEY (playerUid) REFERENCES player (uid),
    CONSTRAINT fk_federationId FOREIGN KEY (federationId) REFERENCES federation (id)
);

CREATE TABLE club
(
    id      integer PRIMARY KEY,
    name    varchar(100) NOT NULL,
    sportId integer      NOT NULL,
    CONSTRAINT fk_sportId FOREIGN KEY (sportId) REFERENCES sport (id)
);

CREATE TABLE team
(
    id       integer PRIMARY KEY,
    name     varchar(100) NOT NULL,
    clubId   integer      NOT NULL,
    leagueId integer      NOT NULL,

    CONSTRAINT fk_clubId FOREIGN KEY (clubId) REFERENCES club (id),
    CONSTRAINT fk_leagueIdd FOREIGN KEY (leagueId) REFERENCES league (id)
);


CREATE TABLE player_play_for_team
(
    jerseyNumber integer   NOT NULL,
    startAt      timestamp NOT NULL,
    endAt        timestamp,
    playerUid    uuid,
    teamId       integer,

    PRIMARY KEY (playerUid, teamId),

    CONSTRAINT fk_playerUid FOREIGN KEY (playerUid) REFERENCES player (uid),
    CONSTRAINT fk_teamId FOREIGN KEY (teamId) REFERENCES team (id)
);

CREATE TABLE stadium
(
    id       integer PRIMARY KEY,
    name     varchar(100) NOT NULL,
    address  varchar(255) NOT NULL,
    capacity integer
);

CREATE TABLE event
(
    uid       uuid PRIMARY KEY,
    name      varchar(100) NOT NULL,
    startAt   timestamp    NOT NULL,
    endAt     timestamp    NOT NULL,
    createdAt timestamp,
    updatedAt timestamp,
    stadiumId integer      NOT NULL,

    CONSTRAINT fk_stadiumId FOREIGN KEY (stadiumId) REFERENCES stadium (id)
);

CREATE TABLE game
(
    eventUid       uuid PRIMARY KEY,
    gameId         varchar(50) NOT NULL,
    scoreHome      integer DEFAULT 0,
    scoreGuest     integer DEFAULT 0,
    canceled       boolean DEFAULT FALSE,
    championshipId integer     NOT NULL,
    teamHomeId     integer     NOT NULL,
    teamGuestId    integer     NOT NULL,

    CONSTRAINT fk_eventUid FOREIGN KEY (eventUid) REFERENCES event (uid),
    CONSTRAINT fk_championshipId FOREIGN KEY (championshipId) REFERENCES championship (id),
    CONSTRAINT fk_teamHomeId FOREIGN KEY (teamHomeId) REFERENCES team (id),
    CONSTRAINT fk_teamGuestId FOREIGN KEY (teamGuestId) REFERENCES team (id),
    CHECK (teamHomeId != teamGuestId)
);

CREATE TABLE training
(
    eventUid    uuid PRIMARY KEY,
    description varchar(255),
    teamId      integer NOT NULL,

    CONSTRAINT fk_eventUid FOREIGN KEY (eventUid) REFERENCES event (uid),
    CONSTRAINT fk_teamId FOREIGN KEY (teamId) REFERENCES team (id)
);

CREATE TABLE administrator
(
    uid       uuid PRIMARY KEY,
    email     varchar(255) UNIQUE NOT NULL,
    lastname  varchar(255)        NOT NULL,
    firstname varchar(255)        NOT NULL,
    password  varchar(255)        NOT NULL
);

CREATE TABLE administrator_player
(
    administratorUid uuid,
    playerUid        uuid,

    PRIMARY KEY (administratorUid, playerUid),

    CONSTRAINT fk_administratorUid FOREIGN KEY (administratorUid) REFERENCES administrator (uid),
    CONSTRAINT fk_playerUid FOREIGN KEY (playerUid) REFERENCES player (uid)
);

CREATE TABLE administrator_club
(
    administratorUid uuid,
    clubId           integer,

    PRIMARY KEY (administratorUid, clubId),

    CONSTRAINT fk_administratorUid FOREIGN KEY (administratorUid) REFERENCES administrator (uid),
    CONSTRAINT fk_clubId FOREIGN KEY (clubId) REFERENCES club (id)
);

CREATE TABLE administrator_federation
(
    administratorUid uuid,
    federationId     integer,

    PRIMARY KEY (administratorUid, federationId),

    CONSTRAINT fk_administratorUid FOREIGN KEY (administratorUid) REFERENCES administrator (uid),
    CONSTRAINT fk_federationId FOREIGN KEY (federationId) REFERENCES federation (id)
);