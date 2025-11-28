import { useState, useEffect } from 'react';
import { Project } from '@/shared/types';
import { projects as staticProjects } from '@/data/projects';

export function useProjects() {
  const [projects, setProjects] = useState<Project[]>([]);
  const [loading, setLoading] = useState(true);
  const [error] = useState<string | null>(null);

  useEffect(() => {
    // Simulate async loading
    const timer = setTimeout(() => {
      setProjects(staticProjects);
      setLoading(false);
    }, 500);

    return () => clearTimeout(timer);
  }, []);

  return { projects, loading, error };
}

export function useProject(id: string) {
  const [project, setProject] = useState<Project | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => {
      const found = staticProjects.find(p => p.id === Number(id));
      if (found) {
        setProject(found);
      } else {
        setError('Project not found');
      }
      setLoading(false);
    }, 500);

    return () => clearTimeout(timer);
  }, [id]);

  return { project, loading, error };
}
