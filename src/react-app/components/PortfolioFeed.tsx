import { motion } from 'framer-motion';
import { Project } from '@/shared/types';
import ProjectCard from './ProjectCard';
import { Dna } from 'lucide-react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

interface PortfolioFeedProps {
  projects: Project[];
  onProjectClick: (project: Project) => void;
}

export default function PortfolioFeed({ projects, onProjectClick }: PortfolioFeedProps) {
  const technicalProjects = projects.filter(p => p.strand_type === 'technical');
  const domainProjects = projects.filter(p => p.strand_type === 'domain');
  const { colors } = useThemeContext();

  return (
    <section className={`min-h-screen bg-gradient-to-br ${colors.background.secondary} py-20 px-4`}>
      <div className="max-w-7xl mx-auto">
        {/* Section Header */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-16"
        >
          <div className="flex items-center justify-center gap-3 mb-4">
            <Dna className="w-12 h-12 text-indigo-400" />
            <h2 className={`text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r ${colors.primary.gradient}`}>
              Project Portfolio
            </h2>
          </div>
          <p className="text-xl text-slate-300 max-w-3xl mx-auto">
            A double helix of innovation: technical mastery meets domain expertise
          </p>
        </motion.div>

        {/* Dual Strand Layout */}
        <div className="grid md:grid-cols-2 gap-8">
          {/* Technical Strand */}
          <div>
            <motion.div
              initial={{ opacity: 0, x: -50 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              className="mb-8"
            >
              <h3 className="text-3xl font-bold mb-2 flex items-center gap-2" style={{ color: colors.primary.light }}>
                <div className="w-3 h-3 rounded-full" style={{ backgroundColor: colors.primary.main }} />
                Technical Strand
              </h3>
              <p className="text-slate-400">Advanced methodologies, algorithms, and architectures</p>
            </motion.div>
            <div className="space-y-6">
              {technicalProjects.map((project, index) => (
                <ProjectCard
                  key={project.id}
                  project={project}
                  index={index}
                  onClick={() => onProjectClick(project)}
                />
              ))}
            </div>
          </div>

          {/* Domain Strand */}
          <div>
            <motion.div
              initial={{ opacity: 0, x: 50 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              className="mb-8"
            >
              <h3 className="text-3xl font-bold mb-2 flex items-center gap-2" style={{ color: colors.secondary.light }}>
                <div className="w-3 h-3 rounded-full" style={{ backgroundColor: colors.secondary.main }} />
                Domain Strand
              </h3>
              <p className="text-slate-400">Industry-specific insights and business impact</p>
            </motion.div>
            <div className="space-y-6">
              {domainProjects.map((project, index) => (
                <ProjectCard
                  key={project.id}
                  project={project}
                  index={index}
                  onClick={() => onProjectClick(project)}
                />
              ))}
            </div>
          </div>
        </div>

        {/* Connecting Visual */}
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          className="mt-16 text-center"
        >
          <div className="inline-flex items-center gap-4 px-8 py-4 rounded-full bg-gradient-to-r from-blue-950/50 to-emerald-950/50 border border-indigo-500/30 backdrop-blur-sm">
            <div className="w-8 h-8 rounded-full animate-pulse" style={{ backgroundColor: colors.primary.main }} />
            <div className={`h-0.5 w-16 bg-gradient-to-r ${colors.secondary.gradient}`} />
            <span className="text-indigo-300 font-medium">Base Pair Connections</span>
            <div className={`h-0.5 w-16 bg-gradient-to-r ${colors.secondary.gradient}`} />
            <div className="w-8 h-8 rounded-full animate-pulse" style={{ backgroundColor: colors.secondary.main }} />
          </div>
        </motion.div>
      </div>
    </section>
  );
}
