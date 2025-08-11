#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🚀  deploy.sh — Commit, create GitHub repo & enable Pages for your Rick Roll
# -----------------------------------------------------------------------------

# 1. Detect your GitHub username
GITHUB_USER="$(gh api user --jq .login)"
REPO_NAME="lcai-rickroll-dapp"
PAGE_URL="https://$GITHUB_USER.github.io/$REPO_NAME/"

echo "👤  Deploying as GitHub user: $GITHUB_USER"
echo "📁  Repo: $REPO_NAME"
echo

# 2. Initialize Git (if needed), commit everything
if [ ! -d .git ]; then
  echo "⚙️  git init"
  git init
fi

echo "➕  Staging files"
git add .

echo "💾  Committing"
git commit -m "Deploy Rick Roll dApp frontend (Official Rick Roll of LCAI)"

# 3. Create GitHub repo & push to main
echo "🌐  Creating & pushing to GitHub"
gh repo create "$GITHUB_USER/$REPO_NAME" \
  --public \
  --source . \
  --remote origin \
  --push \
  --yes

# 4. Enable GitHub Pages on main branch
echo "📄  Enabling GitHub Pages"
gh api \
  --method POST \
  --header "Accept: application/vnd.github.switcheroo-preview+json" \
  "/repos/$GITHUB_USER/$REPO_NAME/pages" \
  -f source='main' \
  -f path='/' \
  > /dev/null

# 5. Success message
echo
echo "✅  Done! Your dApp is now live:"
echo "   $PAGE_URL"
echo
echo "Share the link in Discord and let the rolling begin! 🎶"
