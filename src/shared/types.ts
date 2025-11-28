import z from "zod";

export const ProjectSchema = z.object({
  id: z.number(),
  title: z.string(),
  strand_type: z.enum(['technical', 'domain']),
  description: z.string().nullable(),
  problem: z.string().nullable(),
  method: z.string().nullable(),
  result: z.string().nullable(),
  github_url: z.string().nullable(),
  image_url: z.string().nullable(),
  tags: z.string().nullable(),
  position_index: z.number(),
  created_at: z.string(),
  updated_at: z.string(),
});

export type Project = z.infer<typeof ProjectSchema>;
