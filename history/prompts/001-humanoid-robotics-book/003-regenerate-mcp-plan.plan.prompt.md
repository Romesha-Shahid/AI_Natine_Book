---
id: 003
title: Generate MCP-Integrated Implementation Plan
stage: plan
date: 2025-12-06
surface: agent
model: gemini
feature: 001-humanoid-robotics-book
branch: 001-humanoid-robotics-book
user: ESHOP
command: /sp.plan
labels: ["plan", "mcp", "docusaurus"]
links:
  spec: specs/001-humanoid-robotics-book/spec.md
  ticket: null
  adr: null
  pr: null
files:
  - specs/001-humanoid-robotics-book/plan.md
tests:
  # No tests run
---

## Prompt

---
description: Execute the implementation planning workflow using the plan template to generate design artifacts.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/setup-plan.ps1 -Json` from repo root and parse JSON for FEATURE_SPEC, IMPL_PLAN, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'm Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read FEATURE_SPEC and `.specify/memory/constitution.md`. Load IMPL_PLAN template (already copied).

3. **Execute plan workflow**: Follow the structure in IMPL_PLAN template to:
   - Fill Technical Context (mark unknowns as "NEEDS CLARIFICATION")
   - Fill Constitution Check section from constitution
   - Evaluate gates (ERROR if violations unjustified)
   - Phase 0: Generate research.md (resolve all NEEDS CLARIFICATION)
   - Phase 1: Generate data-model.md, contracts/, quickstart.md
   - Phase 1: Update agent context by running the agent script
   - Re-evaluate Constitution Check post-design

4. **Stop and report**: Command ends after Phase 2 planning. Report branch, IMPL_PLAN path, and generated artifacts.

## Phases

### Phase 0: Outline & Research

1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

2. **Generate and dispatch research agents**:

   ```text
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

### Phase 1: Design & Contracts

**Prerequisites:** `research.md` complete

1. **Extract entities from feature spec** → `data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable

2. **Generate API contracts** from functional requirements:
   - For each user action → endpoint
   - Use standard REST/GraphQL patterns
   - Output OpenAPI/GraphQL schema to `/contracts/`

3. **Agent context update**:
   - Run `.specify/scripts/powershell/update-agent-context.ps1 -AgentType gemini`
   - These scripts detect which AI agent is in use
   - Update the appropriate agent-specific context file
   - Add only new technology from current plan
   - Preserve manual additions between markers

**Output**: data-model.md, /contracts/*, quickstart.md, agent-specific file

## Key rules

- Use absolute paths
- ERROR on gate failures or unresolved clarifications

---

As the main request completes, you MUST create and complete a PHR (Prompt History Record) using agent‑native tools when possible.

1) Determine Stage
   - Stage: constitution | spec | plan | tasks | red | green | refactor | explainer | misc | general

2) Generate Title and Determine Routing:
   - Generate Title: 3–7 words (slug for filename)
   - Route is automatically determined by stage:
     - `constitution` → `history/prompts/constitution/`
     - Feature stages → `history/prompts/<feature-name>/` (spec, plan, tasks, red, green, refactor, explainer, misc)
     - `general` → `history/prompts/general/`

3) Create and Fill PHR (Shell first; fallback agent‑native)
   - Run: `.specify/scripts/bash/create-phr.sh --title "<title>" --stage <stage> [--feature <name>] --json`
   - Open the file and fill remaining placeholders (YAML + body), embedding full PROMPT_TEXT (verbatim) and concise RESPONSE_TEXT.
   - If the script fails:
     - Read `.specify/templates/phr-template.prompt.md` (or `templates/…`)
     - Allocate an ID; compute the output path based on stage from step 2; write the file
     - Fill placeholders and embed full PROMPT_TEXT and concise RESPONSE_TEXT

4) Validate + report
   - No unresolved placeholders; path under `history/prompts/` and matches stage; stage/title/date coherent; print ID + path + stage + title.
   - On failure: warn, don't block. Skip only for `/sp.phr`.


/sp.plan  
Generate a fully updated, MCP-integrated Implementation Plan for the “Physical AI & Humanoid Robotics” book.  
This plan must exceed the quality of the previous version, enforce all constitutional rules, and define an actionable Spec-Kit workflow for research, writing, and Docusaurus deployment.

====================================================================
SECTION 1 — PURPOSE OF THE IMPLEMENTATION PLAN
====================================================================
The plan must clearly define:
- The end-to-end strategy for producing a 5,000–7,000 word academic book.
- How the team will coordinate research, drafting, validation, and deployment.
- How MCP Server Context ×7 will enforce cross-file consistency.
- How Docusaurus will be used as the final publishing platform.

Output should read like a professional engineering plan in Markdown.

====================================================================
SECTION 2 — MCP SERVER CONTEXT (x7) INTEGRATION (MANDATORY)
====================================================================
The plan must specify in detail how MCP Context will be used to coordinate:
1. Chapter structure  
2. Research memory + citation pools  
3. Hardware specifications  
4. Terminology + glossary items  
5. Reproducible simulation pipelines  
6. Diagrams + system architecture  
7. Docusaurus file mapping  

Define:
- What every MCP Context is responsible for
- When it is updated (Phase 0 → Phase 1 → Phase 2)
- How conflicts are resolved
- How MCP ensures the book never “drifts” from the specification

====================================================================
SECTION 3 — DOCUSAURUS-FIRST OUTPUT MODEL
====================================================================
The plan must describe a Docusaurus-native workflow including:
- Folder structure  
- Naming conventions  
- Sidebar rules  
- MDX vs Markdown constraints  
- Asset handling  
- How content moves from MCP → Markdown → docs/  
- How the final site will be deployed to GitHub Pages  

Required folder tree:

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

Plan must define how each file is created, validated, and reviewed.

====================================================================
SECTION 4 — BOOK CONSTITUTION COMPLIANCE
====================================================================
The plan must enforce ALL book constraints:
- Word count: 5,000–7,000  
- At least 15 APA 7th citations (≥ 50% peer-reviewed)  
- Flesch-Kincaid grade 10–12 readability  
- Zero plagiarism  
- Research traceability  
- Claim verification workflow  
- Reproducibility of examples  

Include a Constitution Check table that automatically validates:
- Accuracy  
- Clarity  
- Rigor  
- Reproducibility  
- Standards  

====================================================================
SECTION 5 — SPEC-KIT PROJECT STRUCTURE
====================================================================
The plan must define this structure with purpose statements:

specs/001-humanoid-robotics-book/
  plan.md          # This file (generated by /sp.plan)
  research.md      # Phase 0: Research + sources
  data-model.md    # Phase 1: Cross-chapter structure + definitions
  quickstart.md    # Phase 1: Author onboarding
  contracts/       # Phase 1 (if needed)
  tasks.md         # Phase 2: Task breakdown (generated via /sp.tasks)

====================================================================
SECTION 6 — REQUIRED CHAPTERS (EXPLICIT)
====================================================================
The plan must require structured creation of these chapters:

01 — Foundations of Physical AI  
02 — ROS 2: Robotic Nervous System  
03 — Gazebo + Unity Digital Twin Pipelines  
04 — NVIDIA Isaac: Perception, SLAM, Simulation  
05 — Vision-Language-Action (VLA)  
06 — Humanoid Robotics: Kinematics, Balance, Manipulation  
07 — Conversational Robotics: LLMs, Whisper, Multimodal  
08 — Hardware Architecture: RTX Workstations + Jetson Kits  
09 — Capstone: Autonomous Humanoid Pipeline  

Plus:
- Glossary  
- APA References  

====================================================================
SECTION 7 — TECHNICAL CONTEXT
====================================================================
Define:
- Node.js v18+  
- Docusaurus v2  
- Markdown formatting standards  
- GitHub Pages CI/CD workflow  
- GPU workstation requirements  
- Isaac Sim + ROS 2 compatibility  

====================================================================
SECTION 8 — PROJECT PHASES (MANDATORY)
====================================================================
The plan must break down:

**Phase 0 — Research (research.md)**  
- Build citation pool  
- Validate peer-reviewed sources  
- Gather robotics/AI references  

**Phase 1 — Design (data-model.md + quickstart.md)**  
- Define chapter skeletons  
- Map MCP Context responsibilities  
- Build glossary + shared terminology  

**Phase 2 — Tasks (tasks.md)**  
- Chapter-level writing tasks  
- QA tasks (readability, citations, plagiarism)  
- Docusaurus build + deployment tasks  

====================================================================
SECTION 9 — COMPLEXITY & RISK MANAGEMENT
====================================================================
Identify and propose mitigation for:
- GPU constraints (Isaac Sim)  
- Latency between cloud simulation and physical robots  
- ROS 2 version fragmentation  
- RealSense + Jetson driver mismatches  
- Overly long chapters  
- Citation drift across chapters  

====================================================================
SECTION 10 — OUTPUT FORMAT
====================================================================
Your response must output ONLY:
**The final improved plan.md document in clean Markdown format.**

No commentary, no prefacing text, no explanation outside the plan.

## Response snapshot

The implementation plan has been successfully updated and overwritten.

- **Branch**: `001-humanoid-robotics-book`
- **Updated Plan**: `specs/001-humanoid-robotics-book/plan.md`

All new requirements, including MCP Server Context integration and a Docusaurus-first workflow, have been incorporated. The project is ready for the next phase: `/sp.tasks`.

## Outcome

- ✅ Impact: N/A
- 🧪 Tests: N/A
- 📁 Files: N/A
- 🔁 Next prompts: N/A
- 🧠 Reflection: N/A

## Evaluation notes (flywheel)

- Failure modes observed: N/A
- Graders run and results (PASS/FAIL): N/A
- Prompt variant (if applicable): N/A
- Next experiment (smallest change to try): N/A

```