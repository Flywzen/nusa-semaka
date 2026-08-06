-- ============================================================
-- Jalankan SEKALI ini untuk membersihkan FAQ yang keduplikat,
-- SEBELUM menjalankan ulang supabase-schema.sql.
-- Ini menyisakan 1 baris per pertanyaan (yang paling lama dibuat)
-- dan menghapus sisanya.
-- ============================================================

delete from public.faq a
using public.faq b
where a.question = b.question
  and a.created_at > b.created_at;

-- Kalau ada yang created_at-nya identik (jarang terjadi, tapi jaga-jaga),
-- baris ini beresin sisa duplikat berdasarkan id:
delete from public.faq a
using public.faq b
where a.question = b.question
  and a.id > b.id;

-- Cek hasilnya: harus 0 baris kalau sudah bersih total.
select question, count(*) 
from public.faq 
group by question 
having count(*) > 1;
