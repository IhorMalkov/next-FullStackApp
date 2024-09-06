-- CreateEnum
CREATE TYPE "TaskStatus" AS ENUM ('NOT_STARTED', 'STARTED', 'COMPLETED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "description" TEXT,
    "due" TIMESTAMP(3),
    "deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "TaskStatus" NOT NULL DEFAULT 'NOT_STARTED',
    "name" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "projecId" TEXT NOT NULL,
    "due" TIMESTAMP(3),
    "deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Project_ownerId_id_idx" ON "Project"("ownerId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Project_ownerId_name_key" ON "Project"("ownerId", "name");

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_projecId_fkey" FOREIGN KEY ("projecId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
