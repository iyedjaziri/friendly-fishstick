import { useNavigate } from 'react-router';
import { useProjects } from '@/react-app/hooks/useProjects';
import { Loader2 } from 'lucide-react';
import NucleusSection from '@/react-app/components/NucleusSection';
import PortfolioFeed from '@/react-app/components/PortfolioFeed';
import AboutSection from '@/react-app/components/AboutSection';
import Footer from '@/react-app/components/Footer';
import { Project } from '@/shared/types';

export default function Home() {
  const navigate = useNavigate();
  const { projects, loading } = useProjects();

  const handleProjectClick = (project: Project) => {
    navigate(`/project/${project.id}`);
  };

  if (loading) {
    return (
      <div className="flex flex-col items-center justify-center min-h-screen bg-gradient-to-br from-slate-950 via-indigo-950 to-slate-900">
        <div className="animate-spin mb-4">
          <Loader2 className="w-10 h-10 text-blue-400" />
        </div>
        <p className="text-slate-300">Loading DNA sequences...</p>
      </div>
    );
  }

  return (
    <div className="min-h-screen">
      <NucleusSection projects={projects} onProjectClick={handleProjectClick} />
      <PortfolioFeed projects={projects} onProjectClick={handleProjectClick} />
      <AboutSection />
      <Footer />
    </div>
  );
}
