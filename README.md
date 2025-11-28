# Data DNA Portfolio

A 3D interactive portfolio website visualizing projects as a DNA helix. Built with React, Three.js, and Tailwind CSS.

## Tech Stack

- **Frontend**: React, Vite, TypeScript
- **Styling**: Tailwind CSS
- **3D Graphics**: Three.js, React Three Fiber, React Three Drei
- **Icons**: Lucide React

## Getting Started

### Prerequisites

- Node.js (v20 or higher recommended)
- npm

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Data-DNA-Portfolio.git
   cd Data-DNA-Portfolio
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

## Managing Data

This project uses a static data file for project information.

- **Edit Projects**: Open `src/data/projects.ts` to add, remove, or modify projects.
- **Images**: Place project images in the `public` directory and reference them in the `image_url` field.

## Deployment

This project is configured for automatic deployment to **GitHub Pages**.

1. **Push to GitHub**: Push your changes to the `main` branch.
2. **GitHub Actions**: A workflow will automatically build and deploy the site.
3. **Settings**: Ensure GitHub Pages is enabled in your repository settings (Settings > Pages > Source: GitHub Actions).

## License

MIT
