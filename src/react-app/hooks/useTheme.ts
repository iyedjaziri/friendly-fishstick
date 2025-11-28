import { useState, useEffect } from 'react';

export type Theme = 'dna' | 'helix' | 'genome';

export function useTheme() {
  const [theme, setTheme] = useState<Theme>(() => {
    const stored = localStorage.getItem('dna-theme');
    return (stored as Theme) || 'dna';
  });

  useEffect(() => {
    localStorage.setItem('dna-theme', theme);
    document.documentElement.setAttribute('data-theme', theme);
  }, [theme]);

  const mutateTheme = () => {
    const themes: Theme[] = ['dna', 'helix', 'genome'];
    const currentIndex = themes.indexOf(theme);
    const nextIndex = (currentIndex + 1) % themes.length;
    setTheme(themes[nextIndex]);
  };

  return { theme, mutateTheme };
}
