import { motion } from 'framer-motion';
import { Project } from '@/shared/types';
import { Github, Code2, Target } from 'lucide-react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

interface ProjectCardProps {
  project: Project;
  index: number;
  onClick: () => void;
}

export default function ProjectCard({ project, index, onClick }: ProjectCardProps) {
  const isTechnical = project.strand_type === 'technical';
  const tags = project.tags ? project.tags.split(',') : [];
  const { colors } = useThemeContext();

  const cardColor = isTechnical ? colors.primary : colors.secondary;

  return (
    <motion.div
      initial={{ opacity: 0, y: 50 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ duration: 0.5, delay: index * 0.1 }}
      whileHover={{ scale: 1.02 }}
      onClick={onClick}
      className="group relative cursor-pointer"
    >
      <div
        className="relative overflow-hidden rounded-2xl p-6 backdrop-blur-sm border-2 transition-all duration-300"
        style={{
          background: `linear-gradient(to bottom right, ${cardColor.dark}40, ${cardColor.main}20)`,
          borderColor: `${cardColor.main}30`,
        }}
      >
        {/* Strand indicator */}
        <div className="flex items-center gap-2 mb-3">
          {isTechnical ? (
            <Code2 className="w-5 h-5" style={{ color: cardColor.light }} />
          ) : (
            <Target className="w-5 h-5" style={{ color: cardColor.light }} />
          )}
          <span
            className="text-xs font-semibold uppercase tracking-wider"
            style={{ color: cardColor.light }}
          >
            {project.strand_type} Strand
          </span>
        </div>

        {/* Title */}
        <h3 className={`text-2xl font-bold text-white mb-3 group-hover:text-transparent group-hover:bg-clip-text group-hover:bg-gradient-to-r ${colors.primary.gradient} transition-all`}>
          {project.title}
        </h3>

        {/* Description */}
        <p className="text-slate-300 mb-4 line-clamp-2">
          {project.description}
        </p>

        {/* Tags */}
        <div className="flex flex-wrap gap-2 mb-4">
          {tags.slice(0, 4).map((tag, i) => (
            <span
              key={i}
              className="px-2 py-1 rounded-full text-xs font-medium"
              style={{
                backgroundColor: `${cardColor.main}20`,
                color: cardColor.light,
              }}
            >
              {tag.trim()}
            </span>
          ))}
        </div>



        {/* GitHub link */}
        {project.github_url && (
          <div className="flex items-center gap-2 text-slate-400 hover:text-white transition-colors">
            <Github className="w-4 h-4" />
            <span className="text-sm">View on GitHub</span>
          </div>
        )}

        {/* Glow effect */}
        <div
          className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
          style={{
            background: `linear-gradient(to right, ${cardColor.main}05, transparent)`,
          }}
        />
      </div>
    </motion.div>
  );
}
