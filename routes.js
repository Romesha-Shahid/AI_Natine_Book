import React from 'react';
import ComponentCreator from '@docusaurus/ComponentCreator';

export default [
  {
    path: '/humanoid_robotic/__docusaurus/debug',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug', 'b85'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/config',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/config', '2d5'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/content',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/content', 'f2d'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/globalData',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/globalData', 'eba'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/metadata',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/metadata', '82e'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/registry',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/registry', 'bbd'),
    exact: true
  },
  {
    path: '/humanoid_robotic/__docusaurus/debug/routes',
    component: ComponentCreator('/humanoid_robotic/__docusaurus/debug/routes', 'f58'),
    exact: true
  },
  {
    path: '/humanoid_robotic/markdown-page',
    component: ComponentCreator('/humanoid_robotic/markdown-page', '069'),
    exact: true
  },
  {
    path: '/humanoid_robotic/docs',
    component: ComponentCreator('/humanoid_robotic/docs', '2c6'),
    routes: [
      {
        path: '/humanoid_robotic/docs',
        component: ComponentCreator('/humanoid_robotic/docs', 'cfe'),
        routes: [
          {
            path: '/humanoid_robotic/docs',
            component: ComponentCreator('/humanoid_robotic/docs', '176'),
            routes: [
              {
                path: '/humanoid_robotic/docs/capstone',
                component: ComponentCreator('/humanoid_robotic/docs/capstone', 'c12'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/conversational-ai',
                component: ComponentCreator('/humanoid_robotic/docs/conversational-ai', '3e1'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/gazebo-unity',
                component: ComponentCreator('/humanoid_robotic/docs/gazebo-unity', '393'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/glossary',
                component: ComponentCreator('/humanoid_robotic/docs/glossary', '361'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/hardware-architecture',
                component: ComponentCreator('/humanoid_robotic/docs/hardware-architecture', 'ed0'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/humanoid-systems',
                component: ComponentCreator('/humanoid_robotic/docs/humanoid-systems', 'a0c'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/intro',
                component: ComponentCreator('/humanoid_robotic/docs/intro', '549'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/isaac',
                component: ComponentCreator('/humanoid_robotic/docs/isaac', 'c5c'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/physical-ai',
                component: ComponentCreator('/humanoid_robotic/docs/physical-ai', '2fa'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/references',
                component: ComponentCreator('/humanoid_robotic/docs/references', '6fa'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/ros2',
                component: ComponentCreator('/humanoid_robotic/docs/ros2', 'b05'),
                exact: true,
                sidebar: "bookSidebar"
              },
              {
                path: '/humanoid_robotic/docs/vla',
                component: ComponentCreator('/humanoid_robotic/docs/vla', '210'),
                exact: true,
                sidebar: "bookSidebar"
              }
            ]
          }
        ]
      }
    ]
  },
  {
    path: '/humanoid_robotic/',
    component: ComponentCreator('/humanoid_robotic/', 'e62'),
    exact: true
  },
  {
    path: '*',
    component: ComponentCreator('*'),
  },
];
