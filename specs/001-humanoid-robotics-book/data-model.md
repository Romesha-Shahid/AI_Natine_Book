# Data Model for "Physical AI & Humanoid Robotics Book"

This document defines the key data entities for the book project, as extracted from the feature specification. As this is a content-focused project (a book), the data model describes the structure of the content itself, not a software application's database schema.

## Entity Definitions

### 1. Book

The top-level entity representing the entire work.

-   **Description**: The primary container for all content. It is composed of an ordered sequence of Modules.
-   **Attributes**:
    -   `title`: The main title of the book (e.g., "Physical AI & Humanoid Robotics").
    -   `author`: The author(s) of the book.
    -   `version`: The version of the book.
-   **Relationships**:
    -   Has many `Modules`.
    -   Has many `Sources` (throughout all modules).

### 2. Module

A distinct section or chapter of the book.

-   **Description**: Represents a major thematic section, like a chapter. Each module contains conceptual explanations, examples, and diagrams.
-   **Attributes**:
    -   `title`: The title of the module (e.g., "Module 1 – ROS 2: The Robotic Nervous System").
    -   `objective`: A brief statement describing the learning goal of the module.
    -   `content`: The body of the text for the module, written in Markdown.
-   **Relationships**:
    -   Belongs to one `Book`.
    -   Has many `Diagrams`.
    -   References many `Sources`.

### 3. Source

A citation for a peer-reviewed article, journal, technical documentation, or other reputable reference.

-   **Description**: Represents an external reference used to support claims and provide further reading.
-   **Attributes**:
    -   `citation_key`: A unique key used for in-text citations (e.g., `[Hinton2012]`).
    -   `full_citation`: The complete citation formatted in APA 7th edition style.
    -   `type`: The type of source (e.g., "Journal Article", "Conference Paper", "Book", "Technical Documentation").
-   **Relationships**:
    -   Referenced by many `Modules`.

### 4. Diagram

A visual aid used to illustrate a concept.

-   **Description**: A block diagram, flowchart, or other illustration embedded within a module.
-   **Attributes**:
    -   `title`: A caption or title for the diagram.
    -   `file_path`: The path to the image file (e.g., `/static/img/ros-data-flow.png`).
    -   `alt_text`: A description of the diagram for accessibility.
-   **Relationships**:
    -   Belongs to one `Module`.

## State Transitions

Not applicable for this project, as the data model represents static content structure rather than a dynamic system with states.
