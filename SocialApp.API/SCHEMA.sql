
PRAGMA foreign_keys = off;


CREATE TABLE "__EFMigrationsHistory" (

    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,

    "ProductVersion" TEXT NOT NULL

);


CREATE TABLE "Likes" (

    "LikerId" INTEGER NOT NULL,

    "LikeeId" INTEGER NOT NULL,

    CONSTRAINT "PK_Likes" PRIMARY KEY ("LikeeId", "LikerId"),

    CONSTRAINT "FK_Likes_Users_LikeeId" FOREIGN KEY ("LikeeId") REFERENCES "Users" ("Id") ON DELETE RESTRICT,

    CONSTRAINT "FK_Likes_Users_LikerId" FOREIGN KEY ("LikerId") REFERENCES "Users" ("Id") ON DELETE RESTRICT

);

CREATE TABLE "Messages" (

    "Id" INTEGER NOT NULL CONSTRAINT "PK_Messages" PRIMARY KEY AUTOINCREMENT,

    "SenderId" INTEGER NOT NULL,

    "RecipientId" INTEGER NOT NULL,

    "Content" TEXT NULL,

    "IsRead" INTEGER NOT NULL,

    "DateRead" TEXT NULL,

    "MessageSent" TEXT NOT NULL,

    "SenderDeleted" INTEGER NOT NULL,

    "RecipientDeleted" INTEGER NOT NULL,

    CONSTRAINT "FK_Messages_Users_RecipientId" FOREIGN KEY ("RecipientId") REFERENCES "Users" ("Id") ON DELETE RESTRICT,

    CONSTRAINT "FK_Messages_Users_SenderId" FOREIGN KEY ("SenderId") REFERENCES "Users" ("Id") ON DELETE RESTRICT

);

-- Table: Photos
CREATE TABLE "Photos" (

    "Id" INTEGER NOT NULL CONSTRAINT "PK_Photos" PRIMARY KEY AUTOINCREMENT,

    "Url" TEXT NULL,

    "Description" TEXT NULL,

    "DateAdded" TEXT NOT NULL,

    "IsMain" INTEGER NOT NULL,

    "UserId" INTEGER NOT NULL, "PublicId" TEXT NULL,

    CONSTRAINT "FK_Photos_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id") ON DELETE CASCADE

);

-- Table: Users
CREATE TABLE "Users" (

    "Id" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,

    "Username" TEXT NULL,

    "PasswordHash" BLOB NULL,

    "PasswordSalt" BLOB NULL

, "City" TEXT NULL, "Country" TEXT NULL, "Created" TEXT NOT NULL DEFAULT '0001-01-01 00:00:00', "DateOfBirth" TEXT NOT NULL DEFAULT '0001-01-01 00:00:00', "Gender" TEXT NULL, "Interests" TEXT NULL, "Introduction" TEXT NULL, "KnownAs" TEXT NULL, "LastActive" TEXT NOT NULL DEFAULT '0001-01-01 00:00:00', "Status" TEXT NULL);

CREATE TABLE "Values" (

    "Id" INTEGER NOT NULL CONSTRAINT "PK_Values" PRIMARY KEY AUTOINCREMENT,

    "Name" TEXT NULL

);

-- Index: IX_Likes_LikerId
CREATE INDEX "IX_Likes_LikerId" ON "Likes" ("LikerId");

-- Index: IX_Messages_RecipientId
CREATE INDEX "IX_Messages_RecipientId" ON "Messages" ("RecipientId");

-- Index: IX_Messages_SenderId
CREATE INDEX "IX_Messages_SenderId" ON "Messages" ("SenderId");

-- Index: IX_Photos_UserId
CREATE INDEX "IX_Photos_UserId" ON "Photos" ("UserId");

PRAGMA foreign_keys = on;
