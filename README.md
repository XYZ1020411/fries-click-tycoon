# 🍟 薯條點擊大亨

A responsive, single-page HTML5 clicker tycoon for GitHub + Cloudflare Pages, with optional Supabase score sync.

## Included
- Jelly-bounce fries button, floating money text, particle sparks
- Click income upgrades and passive income upgrades
- Purchase shop, escalating prices, levels and lifetime revenue
- 5-minute timer with pause/resume/reset; passive income pauses when timer expires
- Local autosave and optional Supabase authenticated score sync
- Mobile-friendly responsive layout and reduced-motion support

## Run locally
Open `index.html` in a browser. Local saves use browser `localStorage`. Supabase sync needs network access.

## Supabase setup
1. Create a **new dedicated Supabase project** for this game.
2. The `fries_scores` table and row-level security policies are already configured for this project. For a fresh project, run `supabase/schema.sql` in SQL Editor.
3. In Authentication settings, enable Anonymous Sign-Ins for one-tap cloud sync without an email/password form.
4. `index.html` is already configured for the project URL and public publishable key.
5. Never put a `service_role` or secret key in browser code.

The database policy lets each authenticated user write only their own score row. Public leaderboard reads are allowed. This starter does not yet render a global leaderboard list; it stores the data for the next iteration. Client-submitted scores can be manipulated, so do not use these scores for real prizes.

## Current Supabase project
- Project ref: `pmdbdckspefacykvfvbq`
- Region: `ap-northeast-1` (Tokyo)
- Plan selected: Free (quoted creation cost US$0/month)
- Table and RLS: created and verified

## Deploy to Cloudflare Pages
1. Push the project files to a GitHub repository.
2. In Cloudflare Dashboard, go to **Workers & Pages → Create → Pages → Connect to Git**.
3. Select the repository.
4. For this static HTML project, set build command to blank (or `exit 0` if required) and build output directory to `/`.
5. Deploy. The entry page is `index.html`.

`_headers` adds basic browser security headers. No server-side secret is needed for the static site.