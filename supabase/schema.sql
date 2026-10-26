-- 薯條點擊大亨 Supabase schema
-- Run in the SQL Editor of a NEW dedicated Supabase project.
create table if not exists public.fries_scores (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '薯條店長' check (char_length(display_name) between 1 and 20),
  score bigint not null default 0 check (score >= 0),
  total_clicks bigint not null default 0 check (total_clicks >= 0),
  upgrades integer not null default 0 check (upgrades >= 0),
  updated_at timestamptz not null default now()
);

alter table public.fries_scores enable row level security;

grant select on public.fries_scores to anon, authenticated;
grant insert, update on public.fries_scores to authenticated;

drop policy if exists "Scores are publicly readable" on public.fries_scores;
create policy "Scores are publicly readable"
on public.fries_scores for select
to anon, authenticated
using (true);

drop policy if exists "Players insert own score" on public.fries_scores;
create policy "Players insert own score"
on public.fries_scores for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Players update own score" on public.fries_scores;
create policy "Players update own score"
on public.fries_scores for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

-- Note: client-side scores are not cheat-proof. For competitive rewards,
-- validate score changes in a trusted server-side function/Worker.