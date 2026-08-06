-- ============================================================
-- PT Nusa Semaka Creativepreneur — Supabase Schema
-- Jalankan file ini di: Supabase Dashboard > SQL Editor > New query
-- Aman dijalankan ulang KAPAN SAJA (pakai IF NOT EXISTS / DROP ... IF EXISTS).
--
-- File ini HANYA berisi struktur (tabel, index, trigger, RLS policy).
-- TIDAK ADA data contoh di sini, jadi run ulang tidak akan pernah
-- memunculkan lagi data yang sudah kamu hapus dari admin panel.
--
-- Data contoh awal ada di file terpisah: supabase-seed.sql
-- Jalankan supabase-seed.sql SATU KALI SAJA saat setup pertama.
-- ============================================================

create extension if not exists "pgcrypto";

-- ============================================================
-- TABLE: products
-- ============================================================
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  category text not null check (category in ('minuman','rumah','perawatan')),
  description text default '',
  price numeric,
  show_price boolean not null default true,
  badge text,
  specifications jsonb not null default '[]'::jsonb,
  thumbnail_url text,
  gallery_urls jsonb not null default '[]'::jsonb,
  featured boolean not null default false,
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists products_slug_idx on public.products(slug);
create index if not exists products_published_idx on public.products(published);

-- ============================================================
-- TABLE: articles
-- ============================================================
create table if not exists public.articles (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  category text not null check (category in ('Edukasi','Kegiatan')),
  excerpt text default '',
  content text default '',
  cover_url text,
  reading_time integer not null default 3,
  featured boolean not null default false,
  published_at date not null default current_date,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists articles_slug_idx on public.articles(slug);
create index if not exists articles_published_idx on public.articles(published);

-- ============================================================
-- TABLE: faq
-- ============================================================
create table if not exists public.faq (
  id uuid primary key default gen_random_uuid(),
  question text not null,
  answer text not null,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists faq_sort_idx on public.faq(sort_order);
-- Unique index ini penting supaya "on conflict" di supabase-seed.sql
-- benar-benar bisa mendeteksi FAQ yang sama dan tidak bikin duplikat.
create unique index if not exists faq_question_uidx on public.faq(question);

-- ============================================================
-- TABLE: settings (single row)
-- ============================================================
create table if not exists public.settings (
  id uuid primary key default gen_random_uuid(),
  company_name text default 'PT Nusa Semaka Creativepreneur',
  address text default 'Jl. Raflesia 1 Gg. Swadaya 2 No. 109, Tanjung Senang, Bandar Lampung, Lampung',
  email text default 'nusa.semaka@gmail.com',
  phone text default '0811-1011-6812',
  whatsapp text default '6281110116812',
  google_maps text,
  business_hours text default 'Senin – Sabtu, 08.00 – 17.00 WIB',
  facebook text,
  instagram text default 'https://instagram.com/nusasemakaofficial',
  youtube text,
  logo_url text,
  updated_at timestamptz not null default now()
);

-- ============================================================
-- TABLE: about_gallery
-- Foto slideshow yang tampil di section "Tentang Kami" (beranda).
-- ============================================================
create table if not exists public.about_gallery (
  id uuid primary key default gen_random_uuid(),
  image_url text not null,
  caption text default '',
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists about_gallery_sort_idx on public.about_gallery(sort_order);

-- ============================================================
-- TABLE: about_content
-- Isi halaman "Tentang Kami" (visi/misi & perjalanan) — satu baris saja,
-- sama seperti tabel `settings`. Galeri untuk halaman ini SENGAJA tidak
-- punya tabel sendiri — dia memakai tabel `about_gallery` yang sama
-- dengan galeri di beranda, supaya admin cukup kelola foto di satu
-- tempat (lihat menu "Galeri Tentang Kami" di panel admin).
-- ============================================================
create table if not exists public.about_content (
  id uuid primary key default gen_random_uuid(),
  hero_title text default 'PT Nusa Semaka Creativepreneur',
  hero_lead text default 'Sebuah perusahaan asal Bandar Lampung yang fokus pada pemberdayaan komunitas, pelatihan, kewirausahaan kreatif, produk ramah lingkungan, dan kegiatan edukatif.',
  misi jsonb not null default '[]'::jsonb,
  perjalanan jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

-- ============================================================
-- updated_at auto-trigger
-- ============================================================
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_products_updated on public.products;
create trigger trg_products_updated before update on public.products
  for each row execute function public.set_updated_at();

drop trigger if exists trg_articles_updated on public.articles;
create trigger trg_articles_updated before update on public.articles
  for each row execute function public.set_updated_at();

drop trigger if exists trg_faq_updated on public.faq;
create trigger trg_faq_updated before update on public.faq
  for each row execute function public.set_updated_at();

drop trigger if exists trg_settings_updated on public.settings;
create trigger trg_settings_updated before update on public.settings
  for each row execute function public.set_updated_at();

drop trigger if exists trg_about_gallery_updated on public.about_gallery;
create trigger trg_about_gallery_updated before update on public.about_gallery
  for each row execute function public.set_updated_at();

drop trigger if exists trg_about_content_updated on public.about_content;
create trigger trg_about_content_updated before update on public.about_content
  for each row execute function public.set_updated_at();

-- ============================================================
-- ROW LEVEL SECURITY
-- Aturan: siapa saja boleh BACA data yang published.
-- Hanya user yang sudah login (akun admin) yang boleh CREATE/UPDATE/DELETE.
-- ============================================================
alter table public.products enable row level security;
alter table public.articles enable row level security;
alter table public.faq enable row level security;
alter table public.settings enable row level security;
alter table public.about_gallery enable row level security;
alter table public.about_content enable row level security;

drop policy if exists "public read published products" on public.products;
create policy "public read published products" on public.products
  for select using (published = true);

drop policy if exists "admin full access products" on public.products;
create policy "admin full access products" on public.products
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "public read published articles" on public.articles;
create policy "public read published articles" on public.articles
  for select using (published = true);

drop policy if exists "admin full access articles" on public.articles;
create policy "admin full access articles" on public.articles
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "public read faq" on public.faq;
create policy "public read faq" on public.faq
  for select using (true);

drop policy if exists "admin full access faq" on public.faq;
create policy "admin full access faq" on public.faq
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "public read settings" on public.settings;
create policy "public read settings" on public.settings
  for select using (true);

drop policy if exists "admin full access settings" on public.settings;
create policy "admin full access settings" on public.settings
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "public read published about_gallery" on public.about_gallery;
create policy "public read published about_gallery" on public.about_gallery
  for select using (published = true);

drop policy if exists "admin full access about_gallery" on public.about_gallery;
create policy "admin full access about_gallery" on public.about_gallery
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "public read about_content" on public.about_content;
create policy "public read about_content" on public.about_content
  for select using (true);

drop policy if exists "admin full access about_content" on public.about_content;
create policy "admin full access about_content" on public.about_content
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- ============================================================
-- STORAGE — jalankan SETELAH kamu membuat bucket lewat Dashboard:
-- Storage > New bucket > "products" (Public), "articles" (Public),
-- "logos" (Public), "about" (Public)
-- Lalu jalankan bagian di bawah ini supaya admin bisa upload gambar.
-- ============================================================
drop policy if exists "public read product images" on storage.objects;
create policy "public read product images" on storage.objects
  for select using (bucket_id in ('products','articles','logos','about'));

drop policy if exists "admin upload images" on storage.objects;
create policy "admin upload images" on storage.objects
  for insert with check (bucket_id in ('products','articles','logos','about') and auth.uid() is not null);

drop policy if exists "admin update images" on storage.objects;
create policy "admin update images" on storage.objects
  for update using (bucket_id in ('products','articles','logos','about') and auth.uid() is not null);

drop policy if exists "admin delete images" on storage.objects;
create policy "admin delete images" on storage.objects
  for delete using (bucket_id in ('products','articles','logos','about') and auth.uid() is not null);
