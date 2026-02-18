# Personal Portfolio Website

This repository contains the source code of my personal portfolio website.

It is built as a fullstack application using:

- Spring Boot (Java 21)
- Angular (frontend – coming next)
- PostgreSQL
- Flyway
- Docker and Docker Compose

The project runs entirely with Docker. No local installation of Java, Node, or PostgreSQL is required.

---

## Purpose

The goal of this project is to build and deploy my own production-ready portfolio website to present:

- My projects
- My technical skills
- My experience
- My contact information

---

## Current Status

Backend:
- REST API running on port 8080
- PostgreSQL container
- Flyway database migrations
- /api/health endpoint
- /api/projects endpoint

---

## Run Locally

Run:

docker compose up --build

Backend available at:
http://localhost:8080

Health check:
http://localhost:8080/api/health

---

## Roadmap

- [x] Docker backend setup
- [x] PostgreSQL integration
- [x] Flyway migrations
- [x] Projects database schema
- [ ] Angular frontend
- [ ] UI implementation
- [ ] Deployment
