import * as Babel from '@babel/standalone';
import * as ts from 'typescript';

// Configure the TypeScript transpiler
window.transpileModule = function(source, options) {
  // First compile with TypeScript
  const tsResult = ts.transpileModule(source, {
    compilerOptions: {
      target: ts.ScriptTarget.ES2015,
      module: ts.ModuleKind.ESNext,
      jsx: ts.JsxEmit.React,
      ...options
    }
  });
  
  // Then transpile with Babel for better browser compatibility
  const babelResult = Babel.transform(tsResult.outputText, {
    presets: ['env', 'react'],
    filename: 'typescript.tsx'
  });
  
  return babelResult.code;
};

// Custom import map resolver for .ts and .tsx files
const originalResolve = System.resolve;
System.resolve = function(specifier, parentURL, defaultResolve) {
  if (specifier.endsWith('.ts') || specifier.endsWith('.tsx')) {
    return originalResolve.call(this, specifier, parentURL, defaultResolve);
  }
  return originalResolve.call(this, specifier, parentURL, defaultResolve);
};

// Hook into System.js import to transpile TypeScript files
const originalHook = System.instantiate;
System.instantiate = function(url, parentURL) {
  const originalLoad = this;
  
  if (url.endsWith('.ts') || url.endsWith('.tsx')) {
    return fetch(url)
      .then(response => response.text())
      .then(source => {
        const transpiled = window.transpileModule(source);
        const moduleExports = {};
        const moduleImports = [];
        
        // Execute the transpiled code
        const fn = new Function('exports', 'require', transpiled);
        fn(moduleExports, function(name) {
          moduleImports.push(name);
          return null;
        });
        
        return {
          imports: moduleImports,
          execute: function(imports) {
            return moduleExports;
          }
        };
      });
  }
  
  return originalHook.call(this, url, parentURL);
};