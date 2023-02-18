// @ts-check
import BundleAnalyzer from "@next/bundle-analyzer";
/**
 * Run `build` or `dev` with `SKIP_ENV_VALIDATION` to skip env validation
 */
!process.env.SKIP_ENV_VALIDATION && (await import("./src/env.mjs"));

const withBundleAnalyzer = BundleAnalyzer({
  enabled: process.env.ANALYZE === "true",
});

/** @type {import("next").NextConfig} */
const config = {
  reactStrictMode: true,
  i18n: {
    locales: ["en"],
    defaultLocale: "en",
  },
};

export default withBundleAnalyzer(config);
