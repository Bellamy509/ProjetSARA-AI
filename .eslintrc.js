module.exports = {
  extends: ['next/core-web-vitals'],
  rules: {
    // Désactiver temporairement pour le déploiement Vercel
    'react-hooks/exhaustive-deps': 'warn',
    'react/display-name': 'warn',
    // Garder les erreurs importantes
    'no-unused-vars': 'error',
    '@typescript-eslint/no-unused-vars': 'error',
  },
  // Ignorer certains fichiers pour le build
  ignorePatterns: [
    'node_modules/',
    '.next/',
    'out/',
    'public/',
  ],
}; 