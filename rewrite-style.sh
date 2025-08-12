#!/bin/bash

# Backup original
cp style.css style.css.bak

# Overwrite with new styles
cat > style.css <<EOF
@font-face {
  font-family: 'LightChainSans';
  src: url('assets/LightChainSans.woff2') format('woff2');
}

body {
  margin: 0;
  padding: 0;
  font-family: 'LightChainSans', sans-serif;
  background-color: #f9f9f9;
  color: #333;
}

main {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
}

.rickroll-header h1 {
  font-size: 2rem;
  margin-bottom: 0.3rem;
}

.producer-credit {
  font-size: 0.85rem;
  color: #666;
  font-style: italic;
  margin-bottom: 1.5rem;
}

.rickroll-gif img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 0 12px rgba(0,0,0,0.2);
}

.counter {
  font-size: 1.5rem;
  margin-top: 1rem;
  color: #ff4d4d;
}

.powered-by {
  text-align: center;
  font-size: 0.9rem;
  color: #888;
  margin-top: 2rem;
}
.powered-by strong {
  color: #ff4d4d;
}
EOF

echo "✅ style.css updated. Original saved as style.css.bak"
