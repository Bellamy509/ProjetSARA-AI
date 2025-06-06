#!/bin/bash

echo "🚀 Vérification pré-déploiement Vercel..."

# Couleurs pour les messages
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour afficher les résultats
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
        exit 1
    fi
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

echo "1. Vérification de Node.js..."
node --version > /dev/null 2>&1
print_status $? "Node.js est installé"

echo "2. Vérification de npm..."
npm --version > /dev/null 2>&1
print_status $? "npm est disponible"

echo "3. Installation des dépendances..."
npm ci > /dev/null 2>&1
print_status $? "Dépendances installées"

echo "4. Vérification TypeScript..."
npx tsc --noEmit > /dev/null 2>&1
print_status $? "TypeScript compile sans erreurs"

echo "5. Test du build de production..."
npm run build > /dev/null 2>&1
print_status $? "Build de production réussie"

echo "6. Vérification des fichiers de configuration..."
if [ -f "vercel.json" ]; then
    echo -e "${GREEN}✅ vercel.json présent${NC}"
else
    echo -e "${RED}❌ vercel.json manquant${NC}"
    exit 1
fi

if [ -f "next.config.ts" ]; then
    echo -e "${GREEN}✅ next.config.ts présent${NC}"
else
    echo -e "${RED}❌ next.config.ts manquant${NC}"
    exit 1
fi

echo "7. Vérification des variables d'environnement..."
if [ -f "env.example" ]; then
    echo -e "${GREEN}✅ env.example présent${NC}"
    print_warning "N'oubliez pas de configurer les variables d'environnement dans Vercel !"
else
    print_warning "Fichier env.example non trouvé"
fi

echo "8. Analyse de la taille du bundle..."
BUNDLE_SIZE=$(du -sh .next 2>/dev/null | cut -f1)
if [ ! -z "$BUNDLE_SIZE" ]; then
    echo -e "${GREEN}✅ Taille du bundle: $BUNDLE_SIZE${NC}"
else
    print_warning "Impossible de déterminer la taille du bundle"
fi

echo ""
echo -e "${GREEN}🎉 Projet prêt pour le déploiement Vercel !${NC}"
echo ""
echo "Prochaines étapes :"
echo "1. Commitez vos changements"
echo "2. Poussez vers votre repository git"
echo "3. Connectez le projet sur vercel.com"
echo "4. Configurez les variables d'environnement"
echo "5. Déployez !"
echo ""
echo "Pour déployer via CLI :"
echo "  npm install -g vercel"
echo "  vercel login"
echo "  vercel --prod" 