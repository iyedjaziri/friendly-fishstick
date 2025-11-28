import { createContext, useContext, ReactNode } from 'react';
import { useTheme as useThemeHook, Theme } from '@/react-app/hooks/useTheme';

interface ThemeColors {
  primary: {
    light: string;
    main: string;
    dark: string;
    gradient: string;
  };
  secondary: {
    light: string;
    main: string;
    dark: string;
    gradient: string;
  };
  accent: {
    light: string;
    main: string;
    dark: string;
  };
  background: {
    primary: string;
    secondary: string;
    tertiary: string;
  };
}

const themeColors: Record<Theme, ThemeColors> = {
  dna: {
    primary: {
      light: '#60a5fa',
      main: '#3b82f6',
      dark: '#1e40af',
      gradient: 'from-blue-400 via-indigo-400 to-emerald-400',
    },
    secondary: {
      light: '#34d399',
      main: '#10b981',
      dark: '#047857',
      gradient: 'from-blue-500 to-emerald-500',
    },
    accent: {
      light: '#fbbf24',
      main: '#f59e0b',
      dark: '#d97706',
    },
    background: {
      primary: 'from-slate-950 via-indigo-950 to-slate-900',
      secondary: 'from-slate-900 via-slate-800 to-slate-900',
      tertiary: 'from-slate-900 via-indigo-950 to-slate-950',
    },
  },
  helix: {
    primary: {
      light: '#c084fc',
      main: '#a855f7',
      dark: '#7e22ce',
      gradient: 'from-purple-400 via-fuchsia-400 to-pink-400',
    },
    secondary: {
      light: '#f472b6',
      main: '#ec4899',
      dark: '#be185d',
      gradient: 'from-purple-500 to-pink-500',
    },
    accent: {
      light: '#fb923c',
      main: '#f97316',
      dark: '#ea580c',
    },
    background: {
      primary: 'from-purple-950 via-fuchsia-950 to-slate-900',
      secondary: 'from-slate-900 via-purple-900 to-slate-900',
      tertiary: 'from-slate-900 via-fuchsia-950 to-purple-950',
    },
  },
  genome: {
    primary: {
      light: '#fb923c',
      main: '#f97316',
      dark: '#c2410c',
      gradient: 'from-orange-400 via-amber-400 to-red-400',
    },
    secondary: {
      light: '#f87171',
      main: '#ef4444',
      dark: '#b91c1c',
      gradient: 'from-orange-500 to-red-500',
    },
    accent: {
      light: '#fcd34d',
      main: '#fbbf24',
      dark: '#d97706',
    },
    background: {
      primary: 'from-orange-950 via-red-950 to-slate-900',
      secondary: 'from-slate-900 via-orange-900 to-slate-900',
      tertiary: 'from-slate-900 via-red-950 to-orange-950',
    },
  },
};

interface ThemeContextType {
  theme: Theme;
  mutateTheme: () => void;
  colors: ThemeColors;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export function ThemeProvider({ children }: { children: ReactNode }) {
  const { theme, mutateTheme } = useThemeHook();
  const colors = themeColors[theme];

  return (
    <ThemeContext.Provider value={{ theme, mutateTheme, colors }}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useThemeContext() {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useThemeContext must be used within ThemeProvider');
  }
  return context;
}
