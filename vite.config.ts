import path from "path";
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";



export default defineConfig({
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  base: process.env.NODE_ENV === "production" ? "/Data-DNA-Portfolio/" : "/",
  plugins: [react()],
  server: {
    allowedHosts: true,
  },
  build: {
    chunkSizeWarningLimit: 5000,
  },
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
