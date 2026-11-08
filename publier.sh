#!/bin/sh
# Crée le dépôt public « maquettes » sur GitHub et active GitHub Pages. À lancer une seule fois, par Edmond.
set -e
cd "$(dirname "$0")"
git init -q
git add -A
git commit -qm "Maquettes : accueil et Sushi King"
gh repo create maquettes --public --source=. --remote=origin --push
gh api -X POST repos/edmond-loembe/maquettes/pages -f build_type=legacy -f 'source[branch]=main' -f 'source[path]=/'
echo "OK : https://edmond-loembe.github.io/maquettes/sushi-king/ (en ligne dans 1 à 2 minutes)"
