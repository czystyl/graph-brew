import type { PrismaClient } from "@prisma/client";

export default async function createUser(prisma: PrismaClient) {
  await prisma.user.upsert({
    where: {
      email: "rob@financebrew.io",
    },
    update: {
      emailVerified: new Date(),
      name: "Robs " + Math.random().toString(),
    },
    create: {
      email: "rob@financebrew.io",
      name: "Rob",
      emailVerified: new Date(),
    },
  });
}
