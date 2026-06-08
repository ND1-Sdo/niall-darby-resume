# Niall Darby — Resume Site

Standalone personal resume website. Deployed separately from AstraDesk / ltdstartek.org.

## Local preview

```bash
python3 -m http.server 8765
```

Open http://localhost:8765

## Deploy on Render

1. Push this folder to its own GitHub repo.
2. Render → **New** → **Blueprint** (or **Static Site**).
3. Connect the repo.
4. If using Blueprint, Render reads `render.yaml` automatically.
5. If manual Static Site: Build Command `echo ok`, Publish Directory `.`
