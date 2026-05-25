/*
  Warnings:

  - You are about to drop the `Livro` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Livro";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Plataforma" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Jogo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titulo" TEXT NOT NULL,
    "idGenero" INTEGER NOT NULL,
    CONSTRAINT "Jogo_idGenero_fkey" FOREIGN KEY ("idGenero") REFERENCES "Genero" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "JogoPlataforma" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "jogoId" INTEGER NOT NULL,
    "plataformaId" INTEGER NOT NULL,
    CONSTRAINT "JogoPlataforma_jogoId_fkey" FOREIGN KEY ("jogoId") REFERENCES "Jogo" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "JogoPlataforma_plataformaId_fkey" FOREIGN KEY ("plataformaId") REFERENCES "Plataforma" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
