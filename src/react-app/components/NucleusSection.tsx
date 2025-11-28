import { Canvas } from '@react-three/fiber';
import { OrbitControls, PerspectiveCamera, Stars } from '@react-three/drei';
import { motion } from 'framer-motion';
import DNAHelix from './DNAHelix';
import { Project } from '@/shared/types';
import { useState } from 'react';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

interface NucleusSectionProps {
  projects: Project[];
  onProjectClick: (project: Project) => void;
}

export default function NucleusSection({ projects, onProjectClick }: NucleusSectionProps) {
  const [hoveredId, setHoveredId] = useState<number | null>(null);
  const { colors } = useThemeContext();

  return (
    <section className={`relative h-screen w-full overflow-hidden bg-gradient-to-br ${colors.background.primary}`}>
      {/* 3D DNA Helix Canvas */}
      <div className="absolute inset-0">
        <Canvas>
          <PerspectiveCamera makeDefault position={[0, 0, 15]} fov={50} />
          <OrbitControls
            enableZoom={true}
            enablePan={false}
            maxDistance={25}
            minDistance={10}
            autoRotate
            autoRotateSpeed={0.5}
          />
          <ambientLight intensity={0.5} />
          <pointLight position={[10, 10, 10]} intensity={1} />
          <pointLight position={[-10, -10, -10]} intensity={0.5} />
          <Stars radius={100} depth={50} count={5000} factor={4} saturation={0} fade speed={1} />
          <DNAHelix
            projects={projects}
            onNodeClick={onProjectClick}
            hoveredId={hoveredId}
            onHover={setHoveredId}
          />
        </Canvas>
      </div>

      {/* Text Overlay */}
      <div className="relative z-10 flex h-full flex-col items-center justify-center px-4 text-center pointer-events-none">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1, delay: 0.5 }}
        >
          <h1 className={`text-6xl md:text-8xl font-bold text-transparent bg-clip-text bg-gradient-to-r ${colors.primary.gradient} mb-6`}>
            Iyed Jaziri
          </h1>
          <p className="text-xl md:text-2xl text-blue-200 max-w-2xl mx-auto font-light">
            Bridging computational science and Bio
          </p>
          <p className="text-lg md:text-xl text-blue-200 max-w-2xl mx-auto font-light mt-2">
            Research Data Engineer | Health Systems Innovation
          </p>
          <p className="text-sm md:text-base text-indigo-300 mt-4 opacity-75">
            Rotate • Zoom • Click the helix to explore projects
          </p>
        </motion.div>
      </div>

      {/* Scroll Indicator */}
      <motion.div
        className="absolute bottom-8 left-1/2 transform -translate-x-1/2 pointer-events-none"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 2, duration: 1 }}
      >
        <div className="flex flex-col items-center gap-2">
          <span className="text-blue-300 text-sm">Scroll to explore</span>
          <motion.div
            animate={{ y: [0, 10, 0] }}
            transition={{ duration: 1.5, repeat: Infinity }}
            className="w-6 h-10 border-2 border-blue-400 rounded-full flex items-start justify-center p-2"
          >
            <motion.div className="w-1 h-2 bg-blue-400 rounded-full" />
          </motion.div>
        </div>
      </motion.div>
    </section>
  );
}
