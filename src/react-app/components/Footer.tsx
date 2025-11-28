import { motion } from 'framer-motion';
import { Github, Linkedin, Mail, Dna } from 'lucide-react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

export default function Footer() {
  const { theme, mutateTheme, colors } = useThemeContext();

  return (
    <footer className={`relative bg-gradient-to-br ${colors.background.tertiary} py-16 px-4`}>
      <div className="max-w-6xl mx-auto">
        {/* Call to Action */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-12"
        >
          {/* Social Links */}
          <div className="flex items-center justify-center gap-6 mb-8">
            <motion.a
              href="https://github.com/iyedjaziri/"
              target="_blank"
              rel="noopener noreferrer"
              whileHover={{ scale: 1.1, y: -5 }}
              className="flex items-center gap-2 px-6 py-3 rounded-full bg-slate-800/50 border border-slate-700 text-slate-300 hover:text-white transition-all backdrop-blur-sm"
              style={{
                borderColor: `${colors.primary.main}50`,
              }}
            >
              <Github className="w-5 h-5" />
              <span>GitHub</span>
            </motion.a>

            <motion.a
              href="https://linkedin.com/in/iyedjazjri"
              target="_blank"
              rel="noopener noreferrer"
              whileHover={{ scale: 1.1, y: -5 }}
              className="flex items-center gap-2 px-6 py-3 rounded-full bg-slate-800/50 border border-slate-700 text-slate-300 hover:text-white transition-all backdrop-blur-sm"
              style={{
                borderColor: `${colors.primary.main}50`,
              }}
            >
              <Linkedin className="w-5 h-5" />
              <span>LinkedIn</span>
            </motion.a>

            <motion.a
              href="mailto:iyedjaziri@gmail.com"
              whileHover={{ scale: 1.1, y: -5 }}
              className="flex items-center gap-2 px-6 py-3 rounded-full bg-slate-800/50 border border-slate-700 text-slate-300 hover:text-white transition-all backdrop-blur-sm"
              style={{
                borderColor: `${colors.secondary.main}50`,
              }}
            >
              <Mail className="w-5 h-5" />
              <span>Email</span>
            </motion.a>
          </div>
        </motion.div>

        {/* Theme Mutator */}
        <motion.div
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          className="flex items-center justify-center gap-4 mb-8"
        >
          <span className="text-slate-400">Current genome:</span>
          <motion.button
            onClick={mutateTheme}
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            className={`
              flex items-center gap-2 px-6 py-3 rounded-full font-semibold
              bg-gradient-to-r ${colors.secondary.gradient} text-white
              shadow-lg hover:shadow-xl transition-all
            `}
          >
            <Dna className="w-5 h-5" />
            <span>Mutate Theme</span>
          </motion.button>
          <span className="text-slate-400 capitalize">{theme}</span>
        </motion.div>

        {/* Copyright */}
        <div className="text-center text-slate-500 text-sm border-t border-slate-800 pt-8">
          <p>© {new Date().getFullYear()} Iyed's 💎 Portfolio.</p>
          <p className="mt-2">If you've reached the bottom of this page, let's share a cup of hot water.</p>
          <p className="mt-2">Decoding data, one base pair at a time.</p>
        </div>

        {/* Decorative DNA strand */}
        <div className={`absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r ${colors.secondary.gradient} opacity-50`} />
      </div>
    </footer>
  );
}
