--====================================================================================================================--
--================================================= V1__init.sql =====================================================--
--=========== Initialisation Database. Used for testing. This is not the final structure of the database ! ===========--
--====================================================================================================================--

--==================================================== Tables ========================================================--

CREATE TABLE home                                     -- Home : This table contains information to display on Home page.
(
        id               SMALLINT PRIMARY KEY,                      -- Conventional identification number.
        full_name        VARCHAR(255) NOT NULL,                     -- Your full name.
        headline         VARCHAR(255) NOT NULL,                     -- Your professional title.
        summary          TEXT,                                      -- Main introducing text of the main page.
        location         VARCHAR(255),                              -- Your living/working location.
        email_public     VARCHAR(255),                              -- Your public email address.
        github_url       VARCHAR(512),                              -- The link to your GitHub profile.
        linkedin_url     VARCHAR(512),                              -- The link to your LinkedIn profile.
        cv_url           VARCHAR(512),                              -- The link to your CV.
        updated_at       TIMESTAMP NOT NULL DEFAULT NOW()           -- Conventional for debugging.
);

CREATE TABLE projects                                    -- Projects : This table contains developing project worked on.
(
        id               BIGSERIAL PRIMARY KEY,                     -- Conventional identification number.
        title            VARCHAR(255) NOT NULL,                     -- Title of the project.
        owner            VARCHAR(255) NOT NULL,                     -- Client/Entity who owns the project.
        role             VARCHAR(255) NOT NULL,                     -- Your role on the project.
        start_date       DATE,                                      -- When you started working on this project.
        end_date         DATE,                                      -- When you ended working on this project.
        team_size        INT,                                       -- Optional.
        context          TEXT,                                      -- context/description of the project.
        responsibilities TEXT,                                      -- Key responsibilities, includes bullet-like lines.
        technologies     TEXT,                                      -- Main technologies of the project.
        featured         BOOLEAN NOT NULL DEFAULT FALSE,            -- True if the project is featured on the main page.
        order_index      INT,                                       -- Conventional to help us manipulate the order.
        created_at       TIMESTAMP NOT NULL DEFAULT NOW(),          -- Conventional for debugging.
        updated_at       TIMESTAMP NOT NULL DEFAULT NOW()           -- Conventional for debugging.
);

CREATE TABLE experiences                          -- Experiences : This table contains your current and developing jobs.
(
        id               BIGSERIAL PRIMARY KEY,                     -- Conventional identification number.
        company          VARCHAR(255) NOT NULL,                     -- The name of the company you worked for.
        title            VARCHAR(255) NOT NULL,                     -- your role title (e.g. Software Engineer)
        start_date       DATE NOT NULL,                             -- When you started working for this company.
        end_date         DATE,                                      -- When you ended working for this company.
        summary          TEXT,                                      -- Main introducing text for this job.
        responsibilities TEXT,                                      -- Key responsibilities, includes bullet-like lines.
        technologies     TEXT,                                      -- Main technologies worked on.
        featured         BOOLEAN NOT NULL DEFAULT FALSE,            -- True if this job is featured on the main page.
        created_at       TIMESTAMP NOT NULL DEFAULT NOW(),          -- Conventional for debugging.
        updated_at       TIMESTAMP NOT NULL DEFAULT NOW()           -- Conventional for debugging.
);

--==================================================== Indexes =======================================================--

-- idx_projects_owner :
-- This index optimizes queries filtering projects by owner/client.
-- Example use case: displaying all projects for a specific client (e.g. ONEM, Inetum, Personal).
-- It improves SELECT performance when using WHERE owner = '...'.
CREATE INDEX idx_projects_owner ON projects(owner);

-- idx_projects_featured :
-- This index optimizes queries retrieving only featured projects.
-- Example use case: displaying highlighted projects on the Home page (WHERE featured = TRUE).
-- While not critical for a small portfolio, it is a good performance-oriented practice.
CREATE INDEX idx_projects_featured ON projects(featured);

-- idx_experiences_start_date :
-- This index can help when sorting the experience timeline by date (e.g. ORDER BY start_date DESC),
-- or filtering experiences by date range. For a small dataset it's optional.
CREATE INDEX idx_experiences_start_date ON experiences(start_date);

--=================================================== Seed DATA ======================================================--

INSERT INTO home
    (
     id, full_name, headline, summary, location, email_public, github_url, linkedin_url, cv_url
    )
VALUES
    (
           1,
           'Alexandre Athanasakis',
           'Java / Spring Boot Developer',
           'Personal portfolio website built with Spring Boot and Angular.',
           'Brussels, BE',
           'contact@example.com',
           'https://github.com/interalexDev',
           'https://linkedin.com/in/your-profile',
           'https://example.com/cv.pdf'
    );

INSERT INTO experiences
    (
     company, title, start_date, end_date, summary, responsibilities, technologies, featured
    )
VALUES
    (
           'Inetum',
           'Software Engineer / Consultant',
           '2022-09-01',
           NULL,
           'Consultant on public-sector and enterprise projects.',
           '- Backend development\n- Agile collaboration\n- Feature delivery',
           'Java, Spring Boot, PostgreSQL, Docker',
           TRUE
    );

INSERT INTO projects
    (
    title, owner, role, start_date, end_date, team_size, context, responsibilities, technologies, featured, order_index
    )
VALUES
    (
           'Portfolio Website',
           'Personal',
           'Fullstack Developer',
           '2026-02-01',
           NULL,
           1,
           'Personal portfolio website.',
           '- Designed backend API\n- Docker-first setup\n- Angular integration',
           'Java 21, Spring Boot, PostgreSQL, Flyway, Docker',
           TRUE,
           1
    );