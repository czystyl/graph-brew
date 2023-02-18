# Finance Brew 💸

## 🏗️ Pre requirements

Make sure that you have installed the following packages:

1. [pnpm](https://pnpm.io/installation#using-homebrew)
2. [docker](https://docs.docker.com/desktop/install/mac-install)

## 🏃 Getting started

1. Install dependencies

   ```sh
   pnpm install
   ```

2. Run the Postgres Database and Mailhog locally

   ```sh
   pnpm docker:up
   ```

   - To stop the docker use: `pnpm docker:stop`
   - To remove the docker container and volumes use: `pnpm docker:down`

3. Copy .env.example to .env

   ```sh
   cp .env.example .env
   ```

4. Run migrations

   ```sh
   pnpm prisma:migrate
   ```

5. Run app

   ```sh
   pnpm dev
   ```

## 💽 Database migrations

1. Run pending migrations

   ```sh
   pnpm prisma:migrate
   ```

2. Add migrations
   ```sh
   pnpm prisma:migrate --name migration_name
   ```

## 📧 Development Email service

In the development environment, you can use [Mailhog](https://github.com/mailhog/MailHog) to see the emails the app sends. This prevents the SMTP server scoring from dropping.

> Mailhog Web UI: [`localhost:8025`](http://localhost:8025/)

## Database access

You can use [Prisma Studio](https://www.prisma.io/studio) to browse and update your local database.

```sh
pnpm prisma:studio
```

## Accesses

All the accesses are done via Google groups. To access them, you need to add your email to the group. In some cases, you'll need to have a valid password.

- Vercel - engineering@productbrew.com
- Sendgrid - finance-brew-eng@productbrew.com

## Learn More

- [Next.js](https://nextjs.org)
- [Auth.js](https://authjs.dev/)
- [Prisma](https://prisma.io)
- [tRPC](https://trpc.io)
