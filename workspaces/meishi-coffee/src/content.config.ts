import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const coffeeLog = defineCollection({
  loader: glob({ base: "./src/content/coffee-log", pattern: "**/*.{md,mdx}" }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    place: z.string().optional(),
    brew_method: z.string().optional(),
    roaster: z.string().optional(),
    excerpt: z.string(),
    tags: z.array(z.string()).default([]),
    recommended: z.boolean().default(false),
    draft: z.boolean().default(false),
  }),
});

export const collections = {
  "coffee-log": coffeeLog,
};