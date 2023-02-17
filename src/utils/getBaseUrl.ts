export function getBaseUrl() {
  /* browser should use relative url */
  if (typeof window !== "undefined") {
    return "";
  }

  /* SSR should use vercel url */
  if (process.env.VERCEL_URL) {
    return `https://${process.env.VERCEL_URL}`;
  }

  /* dev SSR should use localhost */
  return `http://localhost:${process.env.PORT ?? 3000}`;
}
