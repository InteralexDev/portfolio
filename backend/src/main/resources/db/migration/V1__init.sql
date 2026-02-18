CREATE TABLE projects (
                          id BIGSERIAL PRIMARY KEY,
                          title VARCHAR(255) NOT NULL,
                          description TEXT,
                          tags TEXT,
                          url VARCHAR(512),
                          created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
