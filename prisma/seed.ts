import { PrismaClient } from "@prisma/client";

import createUser from "./users";

const prisma = new PrismaClient({ log: ["query", "error"] });

async function main() {
  await createUser(prisma);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);

    await prisma.$disconnect();

    process.exit(1);
  });
