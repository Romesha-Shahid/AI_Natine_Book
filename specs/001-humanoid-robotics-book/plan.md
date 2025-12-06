# Implementation Plan: Physical AI & Humanoid Robotics

**Branch**: `001-humanoid-robotics-book` | **Date**: 2025-12-06 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `specs/001-humanoid-robotics-book/spec.md`

---

### SECTION 1 — PURPOSE OF THE IMPLEMENTATION PLAN

This document outlines the end-to-end strategy for producing a 5,000–7,000 word academic book on Physical AI and Humanoid Robotics. It defines the technical architecture, project phases, and quality assurance processes required to deliver a high-quality, Docusaurus-native publication. The plan coordinates all research, drafting, validation, and deployment activities, leveraging a shared context system (MCP Server Context ×7) to ensure cross-chapter consistency and strict adherence to the project constitution.

---

### SECTION 2 — MCP SERVER CONTEXT (x7) INTEGRATION

To maintain consistency and enforce the project constitution, this plan mandates the use of seven distinct MCP (Managed Context Pool) files located in `.specify/memory/`. These files serve as the single source of truth for all shared information.

| MCP Context File | Responsibility | Update Phase | Conflict Resolution |
| :--- | :--- | :--- | :--- |
| **`context-chapters.yml`** | Defines chapter slugs, titles, order, and status (e.g., `draft`, `review`, `done`). | Phase 1 (Design) | The order in this file dictates the final `sidebars.js` and book structure. |
| **`context-research.yml`** | Central repository of all approved citations in APA 7th format, tagged by topic. | Phase 0 (Research) | All in-text citations *must* reference a key from this pool. New sources must be added here first. |
| **`context-hardware.yml`** | Specifies target hardware configurations (e.g., Jetson Kit specs, RTX workstation baseline). | Phase 0 (Research) | All hardware-related examples must conform to the specifications defined in this file. |
| **`context-glossary.yml`** | A centralized list of all technical terms and their approved definitions. | Phase 1 (Design) | The `glossary.md` file is auto-generated from this context. Terms must be consistent. |
| **`context-simulations.yml`**| Defines parameters for reproducible simulations (e.g., Isaac Sim version, key environment settings).| Phase 1 (Design) | All simulation examples in the book must reference these baseline parameters to ensure reproducibility. |
| **`context-architecture.yml`**| Stores descriptions and metadata for all system diagrams. | Phase 1 (Design) | Ensures that diagrams referenced across multiple chapters are described consistently. |
| **`context-docusaurus.yml`**| Maps chapter slugs from `context-chapters.yml` to the final Docusaurus file paths and sidebar entries. | Phase 2 (Tasks) | This file is used by the deployment script to generate `sidebars.js` automatically. |

This system prevents content "drift" by ensuring that all authors and automated agents draw from the same verified pool of information, from initial research through final deployment.

---

### SECTION 3 — DOCUSAURUS-FIRST OUTPUT MODEL

This project will follow a Docusaurus-native workflow, treating the final website as the primary deliverable.

-   **Folder Structure**: All book content will be created directly within the `docs/` directory as Markdown files (`.md`).
-   **Naming Conventions**: Files will be named using a numbered prefix to enforce order (e.g., `01-physical-ai.md`).
-   **Sidebar Rules**: The main sidebar will be generated automatically during the deployment phase from `context-docusaurus.yml`, ensuring it perfectly matches the planned structure.
-   **MDX vs. Markdown**: Standard Markdown (`.md`) will be used for all chapter content to maintain simplicity. MDX may be used for custom React components on the landing page if needed.
-   **Asset Handling**: All images and diagrams will be stored in `static/img/` and referenced in Markdown using relative paths.
-   **Content Workflow**:
    1.  **Drafting**: Authors/agents write content directly into the appropriate `docs/*.md` file.
    2.  **Validation**: Automated checks for readability, citations, and plagiarism are run against the Markdown files.
    3.  **Review**: Pull requests are used for peer review of the Markdown content.
-   **Deployment**: A GitHub Actions workflow will be configured to automatically build the Docusaurus site and deploy the static output to the `gh-pages` branch upon merging to `main`.

The required `docs` folder tree is:
```text
docs/
  00-intro.md
  01-physical-ai.md
  02-ros2.md
  03-gazebo-unity.md
  04-isaac.md
  05-vla.md
  06-humanoid-systems.md
  07-conversational-ai.md
  08-hardware-architecture.md
  09-capstone.md
  glossary.md
  references.md
```

---

### SECTION 4 — BOOK CONSTITUTION COMPLIANCE

This plan enforces all constitutional rules through a combination of MCP context files and automated validation tasks.

-   **Word Count (5,000–7,000)**: A script will run during CI to count words across all files in `docs/` and fail the build if outside the range.
-   **Citations (15+ APA 7th)**: All citations are managed in `context-research.yml`. The build script will validate that at least 15 sources are present and that all in-text citations resolve to a key in the context file.
-   **Readability (Flesch-Kincaid 10–12)**: Automated readability checks will be performed on all Markdown files.
-   **Zero Plagiarism & Traceability**: All content will be subject to plagiarism checks. The research-concurrent method ensures sources are tied directly to drafted content.

#### Constitution Check Table

| Gate | Status | Validation Method |
| :--- | :--- | :--- |
| **Accuracy** | PASS | All claims must be traceable to a source in `context-research.yml`. |
| **Clarity** | PASS | Writing will be checked against the Flesch-Kincaid grade level target. |
| **Rigor** | PASS | `context-research.yml` will enforce the ≥ 50% peer-reviewed source requirement. |
| **Reproducibility**| PASS | Simulation and code examples are governed by `context-simulations.yml` and `context-hardware.yml`. |
| **Standards** | PASS | Word count, citations, and formatting are all validated via automated CI checks. |

---

### SECTION 5 — SPEC-KIT PROJECT STRUCTURE

The project will use the standard Spec-Kit Plus structure to organize planning and design artifacts.

-   `specs/001-humanoid-robotics-book/`
    -   `plan.md`: This implementation plan, guiding the entire project.
    -   `research.md`: Output of Phase 0, containing research findings and key decisions.
    -   `data-model.md`: Output of Phase 1, defining the book's content structure.
    -   `quickstart.md`: Output of Phase 1, providing author and developer onboarding instructions.
    -   `contracts/`: Not applicable for this project.
    -   `tasks.md`: Output of Phase 2, containing the detailed breakdown of all writing and validation tasks.

---

### SECTION 6 — REQUIRED CHAPTERS (EXPLICIT)

The plan mandates the creation of the following chapters, corresponding to the files in the `docs/` directory:

-   `01-physical-ai.md`: Foundations of Physical AI
-   `02-ros2.md`: ROS 2: Robotic Nervous System
-   `03-gazebo-unity.md`: Gazebo + Unity Digital Twin Pipelines
-   `04-isaac.md`: NVIDIA Isaac: Perception, SLAM, Simulation
-   `05-vla.md`: Vision-Language-Action (VLA)
-   `06-humanoid-systems.md`: Humanoid Robotics: Kinematics, Balance, Manipulation
-   `07-conversational-ai.md`: Conversational Robotics: LLMs, Whisper, Multimodal
-   `08-hardware-architecture.md`: Hardware Architecture: RTX Workstations + Jetson Kits
-   `09-capstone.md`: Capstone: Autonomous Humanoid Pipeline
-   `glossary.md`: Glossary (auto-generated from `context-glossary.yml`)
-   `references.md`: APA References (auto-generated from `context-research.yml`)

---

### SECTION 7 — TECHNICAL CONTEXT

-   **Node.js**: `v18.0` or higher.
-   **Docusaurus**: `v2.x` (latest stable release).
-   **Markdown Standards**: GitHub Flavored Markdown (GFM).
-   **GitHub Pages CI/CD**: A `workflow.yml` file will be created to build and deploy the Docusaurus site on every push to `main`.
-   **GPU Workstation Requirements**: NVIDIA RTX 30-series or higher recommended for Isaac Sim.
-   **Isaac Sim / ROS 2**: Use Isaac Sim `2022.2.1` and ROS 2 `Humble Hawksbill` for all examples to ensure compatibility. A Docker environment will be defined to enforce this.

---

### SECTION 8 — PROJECT PHASES (MANDATORY)

**Phase 0 — Research (`research.md`)**
-   Populate `context-research.yml` with at least 20 potential sources, ensuring at least 10 are peer-reviewed.
-   Benchmark the specified Isaac Sim and ROS 2 versions for compatibility.
-   Generate the `research.md` document summarizing key decisions on hardware, software, and `sim-to-real` strategies.

**Phase 1 — Design (`data-model.md` + `quickstart.md`)**
-   Define the final chapter structure in `context-chapters.yml`.
-   Create initial skeletons for all `.md` files in the `docs/` directory.
-   Populate `context-glossary.yml` with at least 20 key terms.
-   Define simulation baselines in `context-simulations.yml`.
-   Generate the `data-model.md` and `quickstart.md` files.

**Phase 2 — Tasks (`tasks.md`)**
-   Use `/sp.tasks` to generate a detailed task list in `tasks.md`.
-   Tasks will be broken down per chapter (e.g., `write-chapter-02`, `review-chapter-02`).
-   Include QA tasks for validating readability, citation count, and plagiarism for each chapter.
-   Include Docusaurus-specific tasks for configuring `sidebars.js` (via script) and deploying to GitHub Pages.

---

### SECTION 9 — COMPLEXITY & RISK MANAGEMENT

| Risk | Mitigation Strategy |
| :--- | :--- |
| **GPU Constraints** | The plan will recommend cloud-based GPU solutions (e.g., Google Colab, AWS) as an alternative for readers without local RTX hardware. Examples will be designed to run within a reasonable timeframe. |
| **Cloud/Physical Latency** | The book will explicitly address latency as a core `sim-to-real` challenge. The capstone project will be conceptual and will not depend on a real-time physical robot connection. |
| **ROS 2 Version Fragmentation** | The plan mandates using a specific version (ROS 2 Humble) and will provide a Dockerfile to ensure a consistent environment for all examples and authors. |
| **Driver Mismatches** | The plan recommends using NVIDIA's official JetPack SDK for Jetson devices, as it bundles pre-validated drivers. This will be a key recommendation in the hardware chapter. |
| **Overly Long Chapters** | A soft word-count limit per chapter will be enforced during the tasking phase (`/sp.tasks`) to ensure content is digestible. |
| **Citation Drift** | All citations must be drawn from the centralized `context-research.yml` file, preventing inconsistencies. This will be enforced by the CI script. |

---

### SECTION 10 — OUTPUT FORMAT

This document serves as the complete implementation plan.