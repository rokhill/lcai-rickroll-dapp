#!/bin/bash

# Backup original
cp index.html index.html.bak

# Overwrite with new content
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Rick Roll dApp</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <main>
    <header class="rickroll-header">
      <h1>Original Rickroll of LCAI</h1>
      <p class="producer-credit">Presented by Llihkor Productions</p>
    </header>

    <div class="rickroll-gif">
      <img src="https://media.tenor.com/0Z3kYbYxKZsAAAAC/rickroll-rick-astley.gif" alt="Rick Roll" />
    </div>

    <div id="roll-count" class="counter">Loading rolls...</div>
  </main>

  <footer class="powered-by">
    <p>Powered by <strong>llihkor</strong></p>
  </footer>
</body>
</html>
EOF

echo "✅ index.html updated. Original saved as index.html.bak"
