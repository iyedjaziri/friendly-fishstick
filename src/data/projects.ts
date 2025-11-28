import { Project } from '@/shared/types';

export const projects: Project[] = [
    {
        id: 1,
        title: "Project Alpha",
        strand_type: "technical",
        description: "A deep dive into machine learning algorithms.",
        problem: "Optimizing neural network training times.",
        method: "Implemented a custom backpropagation algorithm.",
        result: "Reduced training time by 40%.",
        github_url: "https://github.com/example/project-alpha",
        image_url: "https://via.placeholder.com/300",
        tags: "Python, TensorFlow, AI",
        position_index: 0,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    },
    {
        id: 2,
        title: "Project Beta",
        strand_type: "domain",
        description: "Market analysis for renewable energy.",
        problem: "Identifying high-growth potential regions.",
        method: "Analyzed 10 years of geospatial data.",
        result: "Identified 3 key regions for investment.",
        github_url: null,
        image_url: "https://via.placeholder.com/300",
        tags: "Data Analysis, GIS, Energy",
        position_index: 1,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    }
];
