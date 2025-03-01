import React from 'react';
import { createRoot } from 'react-dom/client';
import App from 'components/GameList';

document.addEventListener('DOMContentLoaded', () => {
  const reactRoot = document.getElementById('react-root');
  
  if (reactRoot) {
    const root = createRoot(reactRoot);
    root.render(React.createElement(App, null));
  }
});