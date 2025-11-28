
CREATE TABLE projects (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  strand_type TEXT NOT NULL,
  description TEXT,
  problem TEXT,
  method TEXT,
  result TEXT,
  github_url TEXT,
  image_url TEXT,
  tags TEXT,
  position_index INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_projects_position ON projects(position_index);
