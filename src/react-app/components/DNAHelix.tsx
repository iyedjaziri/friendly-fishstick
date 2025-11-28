import { useRef, useMemo } from 'react';
import { useFrame } from '@react-three/fiber';
import { Sphere, Cylinder, Line } from '@react-three/drei';
import * as THREE from 'three';
import { Project } from '@/shared/types';
import { useThemeContext } from '@/react-app/contexts/ThemeContext';

interface DNAHelixProps {
  projects: Project[];
  onNodeClick?: (project: Project) => void;
  hoveredId?: number | null;
  onHover?: (id: number | null) => void;
}

export default function DNAHelix({ projects, onNodeClick, hoveredId, onHover }: DNAHelixProps) {
  const groupRef = useRef<THREE.Group>(null);
  const { colors } = useThemeContext();
  
  useFrame((state) => {
    if (groupRef.current) {
      groupRef.current.rotation.y = state.clock.getElapsedTime() * 0.1;
    }
  });

  const helixData = useMemo(() => {
    const data = [];
    const totalNodes = projects.length;
    const height = 20;
    const radius = 3;
    const turns = 2;

    for (let i = 0; i < totalNodes; i++) {
      const t = i / (totalNodes - 1);
      const angle = t * Math.PI * 2 * turns;
      const y = -height / 2 + t * height;
      
      const project = projects[i];
      const isLeft = project.strand_type === 'technical';
      
      const x = Math.cos(angle) * radius * (isLeft ? 1 : -1);
      const z = Math.sin(angle) * radius * (isLeft ? 1 : -1);
      
      const oppositeX = -x;
      const oppositeZ = -z;

      data.push({
        project,
        position: [x, y, z] as [number, number, number],
        oppositePosition: [oppositeX, y, oppositeZ] as [number, number, number],
        isLeft,
      });
    }

    return data;
  }, [projects]);

  return (
    <group ref={groupRef}>
      {/* Technical strand (left helix) */}
      {helixData.filter(d => d.isLeft).map((data, i) => (
        <group key={`tech-${i}`}>
          <Sphere
            position={data.position}
            args={[0.25, 32, 32]}
            onClick={() => onNodeClick?.(data.project)}
            onPointerEnter={() => onHover?.(data.project.id)}
            onPointerLeave={() => onHover?.(null)}
          >
            <meshStandardMaterial
              color={hoveredId === data.project.id ? colors.primary.light : colors.primary.main}
              emissive={hoveredId === data.project.id ? colors.primary.main : colors.primary.dark}
              emissiveIntensity={hoveredId === data.project.id ? 0.5 : 0.2}
            />
          </Sphere>
        </group>
      ))}

      {/* Domain strand (right helix) */}
      {helixData.filter(d => !d.isLeft).map((data, i) => (
        <group key={`domain-${i}`}>
          <Sphere
            position={data.position}
            args={[0.25, 32, 32]}
            onClick={() => onNodeClick?.(data.project)}
            onPointerEnter={() => onHover?.(data.project.id)}
            onPointerLeave={() => onHover?.(null)}
          >
            <meshStandardMaterial
              color={hoveredId === data.project.id ? colors.secondary.light : colors.secondary.main}
              emissive={hoveredId === data.project.id ? colors.secondary.main : colors.secondary.dark}
              emissiveIntensity={hoveredId === data.project.id ? 0.5 : 0.2}
            />
          </Sphere>
        </group>
      ))}

      {/* Base pair rungs connecting the strands */}
      {helixData.map((data, i) => {
        const oppositeData = helixData.find(
          d => d.project.position_index === data.project.position_index && d.isLeft !== data.isLeft
        );
        
        if (!oppositeData || data.isLeft) return null;

        return (
          <group 
            key={`rung-${i}`}
            onClick={() => onNodeClick?.(data.project)}
            onPointerEnter={() => onHover?.(data.project.id)}
            onPointerLeave={() => onHover?.(null)}
          >
            <Line
              points={[data.position, oppositeData.position]}
              color={hoveredId === data.project.id ? colors.accent.main : colors.accent.dark}
              lineWidth={hoveredId === data.project.id ? 3 : 2}
              opacity={0.6}
              transparent
            />
            <Cylinder
              position={[
                (data.position[0] + oppositeData.position[0]) / 2,
                (data.position[1] + oppositeData.position[1]) / 2,
                (data.position[2] + oppositeData.position[2]) / 2,
              ]}
              args={[0.08, 0.08, 0.3, 8]}
              rotation={[0, 0, Math.PI / 2]}
            >
              <meshStandardMaterial
                color={hoveredId === data.project.id ? colors.accent.light : colors.accent.main}
                emissive={hoveredId === data.project.id ? colors.accent.main : colors.accent.dark}
                emissiveIntensity={0.3}
                transparent
                opacity={0.7}
              />
            </Cylinder>
          </group>
        );
      })}

      {/* Spiral backbone connections */}
      {helixData.slice(0, -1).map((data, i) => {
        const nextData = helixData[i + 1];
        if (data.isLeft !== nextData.isLeft) return null;

        return (
          <Line
            key={`backbone-${i}`}
            points={[data.position, nextData.position]}
            color={data.isLeft ? colors.primary.main : colors.secondary.main}
            lineWidth={1.5}
            opacity={0.4}
            transparent
          />
        );
      })}
    </group>
  );
}
