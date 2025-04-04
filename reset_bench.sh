#!/bin/bash

echo "🔴 Parando todos os serviços via supervisor..."
sudo supervisorctl stop all

echo "🧹 Limpando __pycache__ e arquivos .pyc..."
find . -type d -name "__pycache__" -exec rm -r {} + 2>/dev/null
find . -type f -name "*.pyc" -delete 2>/dev/null

echo "🧼 Limpando arquivos temporários do Bench..."
bench clear-cache
bench clear-website-cache
bench --site nexforce.test clear-cache

echo "✅ Ambiente limpo. Agora você pode rodar:"
echo "👉 bench restart"
