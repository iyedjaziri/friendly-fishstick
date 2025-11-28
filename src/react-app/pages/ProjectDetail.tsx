import { useParams, useNavigate } from 'react-router';
import ReactMarkdown from 'react-markdown';
import { motion } from 'framer-motion';
import { useProject } from '@/react-app/hooks/useProjects';
import { ArrowLeft, Github, Code2, Target, CheckCircle2 } from 'lucide-react';
import { Loader2 } from 'lucide-react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

export default function ProjectDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { project, loading, error } = useProject(id || '');
  const { colors } = useThemeContext();

  if (loading) {
    return (
      <div className={`flex items-center justify-center min-h-screen bg-gradient-to-br ${colors.background.primary}`}>
        <Loader2 className="w-10 h-10 animate-spin" style={{ color: colors.primary.light }} />
      </div>
    );
  }

  if (error || !project) {
    return (
      <div className={`flex flex-col items-center justify-center min-h-screen bg-gradient-to-br ${colors.background.primary} text-white`}>
        <p className="text-xl mb-4">Project not found</p>
        <button
          onClick={() => navigate('/')}
          className="px-6 py-3 rounded-lg transition-colors"
          style={{
            backgroundColor: colors.primary.main,
          }}
        >
          Back to Home
        </button>
      </div>
    );
  }

  const isTechnical = project.strand_type === 'technical';
  const tags = project.tags ? project.tags.split(',') : [];
  const strandColor = isTechnical ? colors.primary : colors.secondary;

  return (
    <div className={`min-h-screen bg-gradient-to-br ${colors.background.primary}`}>
      {/* Hero Section */}
      <div
        className="relative py-20 px-4"
        style={{
          background: `linear-gradient(to bottom right, ${strandColor.dark}60, ${strandColor.main}30)`,
        }}
      >
        <div className="max-w-5xl mx-auto">
          {/* Back Button */}
          <motion.button
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            onClick={() => navigate('/')}
            className="flex items-center gap-2 text-slate-300 hover:text-white mb-8 transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
            <span>Back to Portfolio</span>
          </motion.button>

          {/* Title and Strand Type */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
          >
            <div className="flex items-center gap-3 mb-4">
              {isTechnical ? (
                <Code2 className="w-8 h-8" style={{ color: strandColor.light }} />
              ) : (
                <Target className="w-8 h-8" style={{ color: strandColor.light }} />
              )}
              <span
                className="text-sm font-semibold uppercase tracking-wider"
                style={{ color: strandColor.light }}
              >
                {project.strand_type} Strand
              </span>
            </div>

            <h1 className="text-5xl md:text-6xl font-bold text-white mb-6">
              {project.title}
            </h1>

            <p className="text-xl text-slate-300 mb-8 max-w-3xl">
              {project.description}
            </p>

            {/* Tags */}
            <div className="flex flex-wrap gap-2 mb-6">
              {tags.map((tag, i) => (
                <span
                  key={i}
                  className="px-3 py-1 rounded-full text-sm font-medium border"
                  style={{
                    backgroundColor: `${strandColor.main}20`,
                    color: strandColor.light,
                    borderColor: `${strandColor.main}30`,
                  }}
                >
                  {tag.trim()}
                </span>
              ))}
            </div>

            {/* GitHub Link */}
            {project.github_url && (
              <motion.a
                href={project.github_url}
                target="_blank"
                rel="noopener noreferrer"
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                className="inline-flex items-center gap-2 px-6 py-3 rounded-lg font-semibold text-white transition-colors"
                style={{
                  backgroundColor: strandColor.main,
                }}
              >
                <Github className="w-5 h-5" />
                <span>View on GitHub</span>
              </motion.a>
            )}
          </motion.div>
        </div>
      </div>

      {/* Content Section */}
      <div className="max-w-5xl mx-auto px-4 py-16">
        {/* Problem - Method - Result */}
        <div className="space-y-12">
          {/* Problem */}
          {project.problem && (
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="bg-slate-800/50 backdrop-blur-sm rounded-2xl p-8 border border-slate-700"
            >
              <h2 className="text-3xl font-bold text-red-400 mb-4 flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-red-500/20 flex items-center justify-center">
                  <span className="text-2xl">🎯</span>
                </div>
                Problem
              </h2>
              <div className="text-slate-300 text-lg leading-relaxed prose prose-invert max-w-none">
                <ReactMarkdown>{project.problem}</ReactMarkdown>
              </div>
            </motion.div>
          )}

          {/* Method */}
          {project.method && (
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="bg-slate-800/50 backdrop-blur-sm rounded-2xl p-8 border border-slate-700"
            >
              <h2 className="text-3xl font-bold text-amber-400 mb-4 flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-amber-500/20 flex items-center justify-center">
                  <span className="text-2xl">⚙️</span>
                </div>
                Method
              </h2>
              <div className="text-slate-300 text-lg leading-relaxed prose prose-invert max-w-none">
                <ReactMarkdown>{project.method}</ReactMarkdown>
              </div>
            </motion.div>
          )}

          {/* Result */}
          {project.result && (
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="backdrop-blur-sm rounded-2xl p-8 border-2"
              style={{
                background: `${strandColor.dark}30`,
                borderColor: `${strandColor.main}50`,
              }}
            >
              <h2
                className="text-3xl font-bold mb-4 flex items-center gap-3"
                style={{ color: strandColor.light }}
              >
                <CheckCircle2 className="w-10 h-10" />
                Result
              </h2>
              <div className="text-white text-lg font-semibold leading-relaxed prose prose-invert max-w-none">
                <ReactMarkdown>{project.result}</ReactMarkdown>
              </div>
            </motion.div>
          )}
        </div>

        {/* Back to Top */}
        <motion.div
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          className="mt-16 text-center"
        >
          <button
            onClick={() => window.scrollTo({ top: 0, behavior: 'smooth' })}
            className="text-slate-400 hover:text-white transition-colors"
          >
            ↑ Back to top
          </button>
        </motion.div>
      </div>
    </div>
  );
}
