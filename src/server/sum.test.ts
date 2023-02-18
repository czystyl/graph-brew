import { expect, test } from "vitest";

import { sum } from "#server/sum";

test("#sum", () => {
  const a = Math.random() * 100;
  const b = Math.random() * 100;

  expect(sum(a, b)).toBe(a + b);
});
