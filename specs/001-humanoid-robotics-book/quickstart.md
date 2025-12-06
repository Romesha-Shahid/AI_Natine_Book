# Quickstart Guide: Humanoid Robotics Book Project

This guide provides the basic steps to set up the Docusaurus development environment and run the book project locally.

## Prerequisites

-   **Node.js**: Version 18.x or higher.
-   **Yarn** (recommended) or **npm**: A JavaScript package manager.

## Local Development

1.  **Install Dependencies**:
    Navigate to the root of the repository and install the necessary Node.js packages. Docusaurus is the primary dependency.

    Using Yarn:
    ```bash
    yarn install
    ```

    Using npm:
    ```bash
    npm install
    ```

2.  **Start the Development Server**:
    Once the dependencies are installed, you can start the local development server. This will build the site and open it in a new browser window. The server will automatically reload when you make changes to the content.

    Using Yarn:
    ```bash
    yarn start
    ```

    Using npm:
    ```bash
    npm start
    ```

    By default, the site will be available at `http://localhost:3000`.

## Project Structure

-   **Book Content**: All book content is located in the `/docs` directory. Each Markdown file in this directory corresponds to a section of the book.
-   **Site Configuration**: The main configuration file is `docusaurus.config.js` in the root of the project.
-   **Sidebar Navigation**: The order and structure of the chapters in the sidebar are defined in `sidebars.js`.
-   **Static Assets**: Images and other static files (like diagrams) should be placed in the `/static/img` directory.

## Building the Site

To create a static production build of the site, run the following command:

Using Yarn:
```bash
yarn build
```

Using npm:
```bash
npm build
```

The output will be placed in the `/build` directory. This is the directory that would be deployed to a web server or a service like GitHub Pages.
