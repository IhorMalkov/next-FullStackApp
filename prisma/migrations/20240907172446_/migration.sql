/*
  Warnings:

  - You are about to drop the column `projecId` on the `Task` table. All the data in the column will be lost.
  - The `status` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `description` to the `Task` table without a default value. This is not possible if the table is not empty.
  - Added the required column `projectId` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "TASK_STATUS" AS ENUM ('NOT_STARTED', 'STARTED', 'COMPLETED');

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_projecId_fkey";

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "projecId",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "projectId" TEXT NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" "TASK_STATUS" NOT NULL DEFAULT 'NOT_STARTED';

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "firstName" DROP NOT NULL,
ALTER COLUMN "lastName" DROP NOT NULL;

-- DropEnum
DROP TYPE "TaskStatus";

-- CreateIndex
CREATE INDEX "Task_ownerId_idx" ON "Task"("ownerId");

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
