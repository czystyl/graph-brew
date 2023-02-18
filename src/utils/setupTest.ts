// import { exec } from "node:child_process";
// import util from "node:util";

import { beforeEach } from "vitest";

import createUser from "#prisma/users";
import { prisma } from "#src/server/db";

beforeEach(async () => {
  // This can be used to reset the database before each test
  // await util.promisify(exec)("pnpm prisma:reset --force");

  console.timeEnd("prisma:reset");
  await createUser(prisma);
});

export default prisma;
