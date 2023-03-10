// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { User } from "@prisma/client";
import type { NextApiRequest, NextApiResponse } from "next";
import { prisma } from "../../db";
type Data = {
  name: string;
  users: User[];
};

export default async function handler(
  _req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const users = await prisma.user.findMany();

  res.status(200).json({
    name: "John Doe" + process.env.NEXT_PUBLIC_ALL_ENV,
    users,
  });
}
