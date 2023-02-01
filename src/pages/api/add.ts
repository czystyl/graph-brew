// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { User } from "@prisma/client";
import type { NextApiRequest, NextApiResponse } from "next";
import { prisma } from "../../db";
type Data = {
  name: string;
  user: User;
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const { name, email } = req.query;

  if (
    !name ||
    !email ||
    typeof name !== "string" ||
    typeof email !== "string"
  ) {
    throw new Error("Invalid parameters");
  }

  const user = await prisma.user.create({
    data: {
      name: name,
      email: email,
    },
  });

  res.status(200).json({
    name: "John Doe" + process.env.NEXT_PUBLIC_ALL_ENV,
    user,
  });
}
