# Guide de Déploiement Vercel

## Prérequis

1. Compte Vercel gratuit : [vercel.com](https://vercel.com)
2. Projet git connecté (GitHub, GitLab, ou Bitbucket)

## Variables d'Environnement Requises

Dans le dashboard Vercel, vous devez configurer ces variables d'environnement :

```bash
# Choisir une des deux options suivantes :

# Option 1 : Si vous utilisez OpenAI en self-hosting
OPENAI_API_KEY=your_openai_api_key_here

# Option 2 : Si vous utilisez Copilot Cloud
NEXT_PUBLIC_COPILOT_CLOUD_API_KEY=your_copilot_cloud_api_key_here
```

## Étapes de Déploiement

### 1. Via l'interface Vercel (Recommandé)

1. Connectez-vous à [vercel.com](https://vercel.com)
2. Cliquez sur "New Project"
3. Importez votre repository git
4. Vercel détectera automatiquement Next.js
5. Ajoutez vos variables d'environnement
6. Cliquez sur "Deploy"

### 2. Via CLI Vercel

```bash
# Installer Vercel CLI globalement
npm i -g vercel

# Se connecter à Vercel
vercel login

# Déployer en preview
npm run vercel:preview

# Déployer en production
npm run vercel:deploy
```

## Configuration du Projet

Le projet est déjà configuré avec :

- ✅ `vercel.json` pour la configuration optimale
- ✅ `next.config.ts` optimisé pour Vercel
- ✅ Scripts npm pour le déploiement
- ✅ Variables d'environnement configurées

## Limites du Plan Gratuit Vercel

- **100 GB** de bande passante par mois
- **1000** builds par mois
- **100** deployments par jour
- Domaines personnalisés gratuits (avec sous-domaine vercel.app)
- Functions timeout : **10 secondes**
- Edge Functions timeout : **30 secondes**

## Optimisations Incluses

- Compression automatique des assets
- Optimisation des images WebP/AVIF
- Tree-shaking automatique
- Headers de sécurité configurés
- Cache optimisé pour les ressources statiques

## Post-Déploiement

1. **Configurez un domaine personnalisé** (optionnel)
2. **Activez les analytics** Vercel (gratuit)
3. **Configurez les notifications** de déploiement
4. **Testez toutes les fonctionnalités** en production

## Surveillance et Debugging

- **Logs de fonction** : Visibles dans le dashboard Vercel
- **Analytics** : Trafic et performance gratuits
- **Source maps** : Activés pour le debugging

## Commandes Utiles

```bash
# Build local pour tester
npm run build:prod

# Vérifier le build sans déployer
npm run build

# Démarrer en mode production localement
npm run start
```

## Support

- [Documentation Vercel](https://vercel.com/docs)
- [Community Discord](https://discord.gg/vercel)
- [GitHub Issues](https://github.com/vercel/vercel/issues) 