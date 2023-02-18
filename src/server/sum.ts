export function sum(a: number, b: number): number {
  if (a > 100) {
    throw new Error("a must be less than 0");
  }
  return a + b;
}
