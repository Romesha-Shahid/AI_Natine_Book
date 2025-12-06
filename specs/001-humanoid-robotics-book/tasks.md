# Tasks: Physical AI & Humanoid Robotics Book

**Input**: Design documents from `specs/001-humanoid-robotics-book/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md

**Organization**: Tasks are grouped by the book's content structure and the user stories they satisfy, enabling a phased writing process.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- All file paths are relative to the repository root.

---

## Phase 1: Setup (Project & MCP Context Initialization)

**Purpose**: Create the Docusaurus project and initialize the Managed Context Pool (MCP) files.

- [ ] T001 Initialize a new Docusaurus classic-themed project in the repository root.
- [ ] T002 [P] Create the MCP context file for chapters at `.specify/memory/context-chapters.yml`.
- [ ] T003 [P] Create the MCP context file for research at `.specify/memory/context-research.yml`.
- [ ] T004 [P] Create the MCP context file for hardware at `.specify/memory/context-hardware.yml`.
- [ ] T005 [P] Create the MCP context file for glossary at `.specify/memory/context-glossary.yml`.
- [ ] T006 [P] Create the MCP context file for simulations at `.specify/memory/context-simulations.yml`.
- [ ] T007 [P] Create the MCP context file for architecture at `.specify/memory/context-architecture.yml`.
- [ ] T008 [P] Create the MCP context file for Docusaurus at `.specify/memory/context-docusaurus.yml`.
- [ ] T009 [P] Create the directory for diagrams at `static/img/`.

---

## Phase 2: Foundational (Chapter Skeletons & MCP Population)

**Purpose**: Create the empty chapter files and populate MCP contexts with initial data from the plan. This prepares the environment for content writing.

**⚠️ CRITICAL**: No chapter writing can begin until this phase is complete.

- [ ] T010 Populate `context-chapters.yml` with the full list of chapter titles and slugs from the plan.
- [ ] T011 [P] Create skeleton file `docs/00-intro.md`.
- [ ] T012 [P] Create skeleton file `docs/01-physical-ai.md`.
- [ ] T013 [P] Create skeleton file `docs/02-ros2.md`.
- [ ] T014 [P] Create skeleton file `docs/03-gazebo-unity.md`.
- [ ] T015 [P] Create skeleton file `docs/04-isaac.md`.
- [ ] T016 [P] Create skeleton file `docs/05-vla.md`.
- [ ] T017 [P] Create skeleton file `docs/06-humanoid-systems.md`.
- [ ] T018 [P] Create skeleton file `docs/07-conversational-ai.md`.
- [ ] T019 [P] Create skeleton file `docs/08-hardware-architecture.md`.
- [ ] T020 [P] Create skeleton file `docs/09-capstone.md`.
- [ ] T021 [P] Create skeleton file `docs/glossary.md`.
- [ ] T022 [P] Create skeleton file `docs/references.md`.
- [ ] T023 [P] Populate `context-glossary.yml` with at least 20 key terms from `plan.md`.
- [ ] T024 [P] Populate `context-research.yml` with at least 15 placeholder sources to be filled in during writing.

**Checkpoint**: Foundation ready - chapter writing can now begin.

---

## Phase 3: User Story 1 - Understand Core Robotics Concepts (Priority: P1) 🎯 MVP

**Goal**: Write the foundational chapters that introduce core robotics concepts (Physical AI, ROS 2, and Simulation).

**Independent Test**: A reader can explain the roles of ROS 2 and a Digital Twin after reading the generated content.

- [ ] T025 [US1] Write the introduction chapter in `docs/00-intro.md`.
- [ ] T026 [US1] Write the "Foundations of Physical AI" chapter in `docs/01-physical-ai.md`.
- [ ] T027 [US1] Write the "ROS 2: Robotic Nervous System" chapter in `docs/02-ros2.md`.
- [ ] T028 [P] [US1] Create a diagram illustrating ROS 2 data flow and save it to `static/img/ros-data-flow.png`.
- [ ] T029 [US1] Embed the ROS 2 diagram in `docs/02-ros2.md`.
- [ ] T030 [US1] Write the "Gazebo + Unity Digital Twin Pipelines" chapter in `docs/03-gazebo-unity.md`.

**Checkpoint**: The first four chapters are written, providing a solid introduction to the core concepts. This represents the MVP.

---

## Phase 4: User Story 2 - Grasp AI-to-Robot Integration (Priority: P2)

**Goal**: Write the advanced chapters covering the AI-driven aspects of robotics (NVIDIA Isaac, VLA, and Humanoid Systems).

**Independent Test**: A reader can outline the VLA pipeline and the purpose of sim-to-real after reading the content.

- [ ] T031 [US2] Write the "NVIDIA Isaac: Perception, SLAM, Simulation" chapter in `docs/04-isaac.md`.
- [ ] T032 [US2] Write the "Vision-Language-Action (VLA)" chapter in `docs/05-vla.md`.
- [ ] T033 [P] [US2] Create a diagram of the VLA pipeline and save it to `static/img/vla-pipeline.png`.
- [ ] T034 [US2] Embed the VLA pipeline diagram in `docs/05-vla.md`.
- [ ] T035 [US2] Write the "Humanoid Robotics: Kinematics, Balance, Manipulation" chapter in `docs/06-humanoid-systems.md`.
- [ ] T036 [US2] Write the "Conversational Robotics: LLMs, Whisper, Multimodal" chapter in `docs/07-conversational-ai.md`.

**Checkpoint**: The core AI and advanced robotics chapters are complete.

---

## Phase 5: User Story 3 - Evaluate Technical Trade-offs (Priority: P3)

**Goal**: Write the concluding chapters that synthesize the learned concepts into a capstone project and discuss hardware trade-offs.

**Independent Test**: A reader can discuss the pros and cons of different hardware choices based on the content.

- [ ] T037 [US3] Write the "Hardware Architecture: RTX Workstations + Jetson Kits" chapter in `docs/08-hardware-architecture.md`.
- [ ] T038 [US3] Write the "Capstone: Autonomous Humanoid Pipeline" chapter in `docs/09-capstone.md`.
- [ ] T039 [P] [US3] Create a diagram of the full capstone pipeline and save it to `static/img/capstone-pipeline.png`.
- [ ] T040 [US3] Embed the capstone diagram in `docs/09-capstone.md`.

**Checkpoint**: All primary content chapters are now complete.

---

## Phase 6: Polish & Deployment

**Purpose**: Finalize the book by auto-generating references, configuring Docusaurus, and setting up deployment.

- [ ] T041 [P] Write a script to auto-generate `docs/glossary.md` from `context-glossary.yml`.
- [ ] T042 [P] Write a script to auto-generate `docs/references.md` from `context-research.yml`.
- [ ] T043 Run the script to generate `docs/glossary.md`.
- [ ] T044 Run the script to generate `docs/references.md`.
- [ ] T045 Configure `docusaurus.config.js` with the book's title, favicon, and theme settings.
- [ ] T046 Configure `sidebars.js` to reflect the chapter order defined in `context-chapters.yml`.
- [ ] T047 Create a GitHub Actions workflow at `.github/workflows/deploy.yml` to build and deploy the site to GitHub Pages.
- [ ] T048 Perform a final validation run: check for broken links, word count, and citation count.

---

## Dependencies & Execution Order

- **Phase 1 (Setup)** can start immediately.
- **Phase 2 (Foundational)** depends on Phase 1.
- **Phase 3 (US1)** depends on Phase 2.
- **Phase 4 (US2)** depends on Phase 2.
- **Phase 5 (US3)** depends on Phase 2.
- **Phase 6 (Polish)** depends on the completion of Phases 3, 4, and 5.

The user story phases (3, 4, 5) can be worked on in parallel after Phase 2 is complete.

## Implementation Strategy

1.  **MVP First**: Complete Phases 1, 2, and 3 to deliver the core foundational chapters. This provides immediate value and a testable slice of the book.
2.  **Incremental Delivery**: Subsequently complete Phase 4 and Phase 5 to add the advanced and concluding chapters.
3.  **Finalize**: Complete Phase 6 to prepare the book for its final public deployment.
