import { motion } from 'framer-motion';
import { Dna, Microscope, Brain, Sparkles } from 'lucide-react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

export default function AboutSection() {
  const { colors } = useThemeContext();

  const journey = [
    {
      year: '2026',
      title: 'Future Vision',
      description: 'Investigating how existing healthcare infrastructure can better serve populations through coordination models and interoperability frameworks (more to come... C²)',
      icon: 'C²',
    },
    {
      year: 'Present',
      title: 'Implementation Science',
      description: 'Pursuing Master\'s in Health Engineering (Quality/Risk/Health Systems specialization) at Université Nice-Côte d\'Azur',
      icon: '🏥',
    },
    {
      year: '2025',
      title: 'Electrophysiology Training',
      description: 'Electrophysiology training (E2M, PhyMedExp); exploring how computational methods can address fragmented accessibility gaps in research & healthcare systems',
      icon: '⚡',
    },
    {
      year: '2025',
      title: 'Computational Biology Systems',
      description: 'Research Assistant at INM conducting multi-omics data integration for inner ear palmitoylation research',
      icon: '✨',
    },
    {
      year: '2024',
      title: 'Entrepreneurial Leap',
      description: 'Working on founding Union (immigration service optimization using NLP/AI), discovering deep passion for health systems implementation',
      icon: 'xU',
    },
    {
      year: '2024',
      title: 'Academic Expansion',
      description: 'Attended Anthropology and Biology classes at University of Toronto',
      icon: '🎓',
    },
    {
      year: '2024',
      title: 'Biology Convergence',
      description: 'Audited MIT Media Lab\'s "How to Grow Almost Anything" (HTGAA) course under Joseph M. Jacobson, George Church, and David S. Kong',
      icon: '💡',
    },
    {
      year: '2022',
      title: 'Data-Driven Growth',
      description: 'Growth Engineer at Mindflow, User segmentation, internal productivity tools for cross-functional teams',
      icon: '🌀',
    },
    {
      year: '2019',
      title: 'Engineering Path',
      description: 'Entered EPITA Engineering School, led Sales Engineering at Cristal Junior-Enterprise, implementing end-to-end pipelines and KPI metrics for portfolio management. Business Driven',
      icon: '🔬',
    },
    {
      year: '2016',
      title: 'Foundation',
      description: 'Mathematical and scientific training at Lycée Fénélon (CPGE MPSI/MP), building analytical foundations',
      icon: '🧬',
    },
  ];

  const philosophy = [
    {
      icon: <Brain className="w-8 h-8" />,
      title: 'Implementation Over Innovation',
      description: 'Technology exists. Infrastructure exists. The gap lies in making existing systems actually work together for those who need them most.',
    },
    {
      icon: <Microscope className="w-8 h-8" />,
      title: 'Multi-Faceted by Design',
      description: 'My diverse background functions like an internal team of specialized agents: computer science rigor, biotechnology insight, health systems engineering.',
    },
    {
      icon: <Sparkles className="w-8 h-8" />,
      title: 'Contaminating Science with Creativity',
      description: 'My dream is to contaminate the future of science with creativity—to explore facets and design methods of turning limits into realities.',
    },
    {
      icon: <Dna className="w-8 h-8" />,
      title: 'Translational Expertise in Action',
      description: 'I aim to build bridges among Biology, Data, and Design, leveraging computational models to engineer systems that address fragmented care journeys.',
    },
  ];

  return (
    <section className={`relative min-h-screen bg-gradient-to-br ${colors.background.tertiary} py-20 px-4 overflow-hidden`}>
      {/* DNA Strand Background Animation */}
      <div className="absolute inset-0 opacity-10">
        <motion.div
          animate={{
            rotate: 360,
          }}
          transition={{
            duration: 60,
            repeat: Infinity,
            ease: 'linear',
          }}
          className="absolute top-1/4 left-1/4 w-96 h-96"
        >
          <Dna className="w-full h-full" style={{ color: colors.primary.main }} />
        </motion.div>
      </div>

      <div className="relative max-w-6xl mx-auto">
        {/* Section Header */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-16"
        >
          <h2 className={`text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r ${colors.primary.gradient} mb-4`}>
            Origin Story
          </h2>
          <p className="text-xl text-slate-300 max-w-3xl mx-auto">
            The journey from data curiosity to building impactful solutions
          </p>
        </motion.div>

        {/* Timeline */}
        <div className="mb-20">
          <div className="relative">
            {/* Central DNA strand line */}
            <div
              className={`absolute left-1/2 transform -translate-x-1/2 h-full w-1 bg-gradient-to-b ${colors.secondary.gradient} opacity-30`}
            />

            {journey.map((item, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, x: index % 2 === 0 ? -50 : 50 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
                className={`relative mb-12 flex items-center ${index % 2 === 0 ? 'flex-row' : 'flex-row-reverse'
                  }`}
              >
                {/* Content */}
                <div className={`w-5/12 ${index % 2 === 0 ? 'text-right pr-8' : 'text-left pl-8'}`}>
                  <div
                    className="inline-block bg-slate-800/60 backdrop-blur-sm rounded-2xl p-6 border border-slate-700 transition-all"
                    style={{
                      borderColor: `${colors.primary.main}50`,
                    }}
                  >
                    <div className="text-4xl mb-2">{item.icon}</div>
                    <h3 className="text-2xl font-bold text-white mb-2">{item.title}</h3>
                    <p className="text-sm font-semibold mb-2" style={{ color: colors.primary.light }}>{item.year}</p>
                    <p className="text-slate-300">{item.description}</p>
                  </div>
                </div>

                {/* Center node */}
                <div
                  className={`absolute left-1/2 transform -translate-x-1/2 w-6 h-6 rounded-full bg-gradient-to-r ${colors.secondary.gradient} border-4 border-slate-900 z-10`}
                />
              </motion.div>
            ))}
          </div>
        </div>

        {/* Philosophy Grid */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="mb-16"
        >
          <h3 className="text-4xl font-bold text-center text-white mb-12">
            Core Philosophy
          </h3>
          <div className="grid md:grid-cols-2 gap-6">
            {philosophy.map((item, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
                whileHover={{ scale: 1.02 }}
                className="bg-slate-800/40 backdrop-blur-sm rounded-2xl p-6 border border-slate-700 transition-all"
                style={{
                  borderColor: `${colors.primary.main}50`,
                }}
              >
                <div style={{ color: colors.primary.light }}>{item.icon}</div>
                <h4 className="text-xl font-bold text-white mb-3 mt-4">{item.title}</h4>
                <p className="text-slate-300">{item.description}</p>
              </motion.div>
            ))}
          </div>
        </motion.div>

        {/* Interests/Skills */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="backdrop-blur-sm rounded-2xl p-8 border"
          style={{
            background: `linear-gradient(to right, ${colors.primary.dark}40, ${colors.secondary.dark}40)`,
            borderColor: `${colors.primary.main}30`,
          }}
        >
          <div className="text-center">
            <div className="text-4xl mb-4">🌍</div>
            <h4 className="text-2xl font-semibold mb-4" style={{ color: colors.accent.light }}>Synthetic Biology Explorer</h4>
            <p className="text-slate-300 text-lg max-w-3xl mx-auto">
              I believe Biology to be the next industrial revolution with Synthetic Biology at its heart.
            </p>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
