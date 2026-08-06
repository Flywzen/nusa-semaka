-- ============================================================
-- PT Nusa Semaka Creativepreneur — Seed Data
--
-- !!! PENTING !!!
-- Jalankan file ini HANYA SEKALI, saat pertama kali setup database
-- (setelah menjalankan supabase-schema.sql).
--
-- JANGAN dijalankan ulang setelah kamu mulai mengelola data lewat
-- admin panel. Kalau kamu hapus salah satu produk/artikel/FAQ di
-- admin lalu run file ini lagi, data yang dihapus itu akan
-- muncul lagi — karena "on conflict do nothing" hanya mencegah
-- duplikat selama datanya MASIH ADA, bukan mencegah data yang
-- sudah dihapus untuk dibuat ulang.
--
-- Kalau memang mau reset ke data contoh awal, itu justru fungsi
-- file ini — silakan run ulang dengan sadar untuk keperluan itu.
-- ============================================================

insert into public.products (slug, name, category, description, price, show_price, badge, specifications, featured, sort_order)
values
('kombucha-fruit-enzyme-250ml','Kombucha Fruit Enzyme 250ml','minuman','Minuman fermentasi kombucha dengan tambahan fruit enzyme, kaya probiotik dan postbiotik alami. Diproses melalui fermentasi tradisional dengan SCOBY tanpa bahan pengawet.',50000,true,'Favorit','[["Volume","250 ml"],["Proses","Fermentasi SCOBY alami"],["Kandungan","Probiotik & postbiotik"],["Penyimpanan","Simpan di kulkas"]]',true,1),
('fruit-enzyme-murni-250ml','Fruit Enzyme Murni 250ml','minuman','Cairan fruit enzyme hasil fermentasi buah segar selama tiga bulan, kaya asam organik alami. Cocok dikonsumsi langsung atau dicampur air hangat.',50000,true,null,'[["Volume","250 ml"],["Proses","Fermentasi buah, 3 bulan"],["Penyimpanan","Suhu ruang, tempat sejuk"]]',false,2),
('sabun-cuci-piring-eco-enzyme','Sabun Cuci Piring Eco-Enzyme','rumah','Sabun cuci piring alami dari fermentasi eco-enzyme, ampuh mengangkat minyak namun tetap lembut di tangan. Aman untuk saluran air dan lingkungan.',10000,true,'Best Seller','[["Volume","250 ml"],["Bahan utama","Eco-enzyme buah & sayur"],["Cocok untuk","Semua jenis peralatan dapur"]]',true,3),
('deterjen-pencuci-pakaian-eco-enzyme','Deterjen Pencuci Pakaian Eco-Enzyme','rumah','Deterjen cair berbahan dasar eco-enzyme yang membersihkan pakaian secara maksimal tanpa meninggalkan residu bahan kimia keras.',null,false,null,'[["Volume","500 ml"],["Bahan utama","Eco-enzyme alami"],["Cocok untuk","Mesin cuci & cuci tangan"]]',false,4),
('sabun-cuci-perlengkapan-bayi','Sabun Cuci Perlengkapan Bayi','rumah','Diformulasikan khusus dari eco-enzyme untuk membersihkan botol dan perlengkapan bayi dengan lembut, tanpa residu berbahaya.',null,false,null,'[["Volume","250 ml"],["Bahan utama","Eco-enzyme alami"],["Cocok untuk","Botol susu & perlengkapan bayi"]]',false,5),
('detox-kaki-eco-enzyme','Detox Kaki Eco-Enzyme','perawatan','Larutan rendam kaki dari eco-enzyme yang membantu melancarkan sirkulasi darah, meredakan pegal, dan menyegarkan tubuh setelah aktivitas harian.',null,false,null,'[["Volume","250 ml"],["Cara pakai","Campurkan dengan air hangat"],["Manfaat","Relaksasi & sirkulasi darah"]]',true,6),
('antiseptik-eco-enzyme','Antiseptik Eco-Enzyme','perawatan','Cairan antiseptik alami hasil fermentasi buah yang membantu membersihkan luka ringan dan menjaga kebersihan tanpa bahan kimia keras.',null,false,null,'[["Volume","250 ml"],["Bahan utama","Eco-enzyme buah"],["Kegunaan","Antiseptik ringan & obat kumur"]]',false,7),
('face-serum-eco-enzyme','Face Serum Eco-Enzyme','perawatan','Serum wajah dengan kandungan eco-enzyme yang membantu menyegarkan dan melembapkan kulit secara alami, tanpa bahan kimia keras.',150000,true,'Baru','[["Volume","30 ml"],["Bahan utama","Eco-enzyme & bahan alami"],["Cocok untuk","Semua jenis kulit"]]',true,8),
('shampo-eco-enzyme','Shampo Eco-Enzyme','perawatan','Shampo alami berbahan dasar eco-enzyme yang membersihkan kulit kepala secara lembut dan menjaga kesehatan rambut sehari-hari.',50000,true,null,'[["Volume","250 ml"],["Bahan utama","Eco-enzyme alami"]]',false,9),
('face-wash-premium-eco-enzyme','Face Wash Premium Eco-Enzyme','perawatan','Sabun cuci muka dengan formula eco-enzyme premium yang membersihkan wajah tanpa membuat kulit terasa kering.',75000,true,null,'[["Volume","100 ml"],["Bahan utama","Eco-enzyme alami"]]',false,10)
on conflict (slug) do nothing;

insert into public.articles (slug, title, category, excerpt, content, reading_time, featured, published_at)
values
('pelatihan-eco-enzyme-fruit-enzyme-kader-pkk-lampung','Pelatihan Eco-Enzyme & Fruit Enzyme bagi Kader PKK se-Provinsi Lampung','Kegiatan','Ratusan kader PKK dari berbagai kabupaten/kota di Lampung mengikuti pelatihan pembuatan eco-enzyme dan fruit enzyme bersama tim Nusa Semaka.',
'Pada penghujung tahun 2025, tim Nusa Semaka Creativepreneur dipercaya untuk menjadi fasilitator pelatihan pembuatan eco-enzyme dan fruit enzyme bagi kader PKK se-Provinsi Lampung. Kegiatan ini diikuti oleh perwakilan kader dari berbagai kabupaten dan kota, sebagai bagian dari upaya bersama mendorong rumah tangga yang lebih ramah lingkungan.

Peserta diajak memahami proses fermentasi sisa kulit buah dan sayur menjadi cairan eco-enzyme yang dapat diolah lebih lanjut menjadi produk pembersih rumah tangga, mulai dari sabun cuci piring hingga deterjen pakaian.

Selain aspek lingkungan, pelatihan ini juga membuka peluang ekonomi baru bagi peserta untuk memproduksi dan memasarkan produk eco-enzyme secara mandiri di lingkungan masing-masing.', 4, false, '2025-11-20'),
('apa-itu-fermentasi','Apa Itu Fermentasi? Mengenal Proses di Balik Produk Kami','Edukasi','Sebelum menjadi kombucha maupun eco-enzyme, semua bermula dari satu proses alami yang sama: fermentasi. Yuk kenalan lebih dekat.',
'Fermentasi adalah proses alami di mana mikroorganisme seperti bakteri dan ragi mengubah gula menjadi asam, gas, atau alkohol. Proses inilah yang menjadi dasar dari hampir seluruh produk Nusa Semaka, mulai dari kombucha hingga eco-enzyme.

Dalam pembuatan kombucha, kultur SCOBY bekerja mengubah larutan teh manis menjadi minuman kaya probiotik selama proses fermentasi berlangsung. Sementara pada eco-enzyme, sisa kulit buah dan gula difermentasi bersama air selama beberapa bulan hingga menghasilkan cairan multifungsi.

Memahami proses ini penting agar masyarakat semakin percaya diri untuk mulai memfermentasi bahan-bahan alami di rumah masing-masing.', 5, false, '2025-12-03'),
('scoby-itu-hidup','SCOBY Itu Hidup: Mengenal Sahabat Fermentasi Kombucha','Edukasi','Banyak yang bertanya-tanya, benarkah SCOBY di dalam toples kombucha kita benar-benar hidup? Simak penjelasannya.',
'SCOBY atau Symbiotic Culture of Bacteria and Yeast adalah kultur hidup yang menjadi jantung dari proses fermentasi kombucha. Lapisan kenyal ini bekerja mengubah larutan teh manis menjadi minuman kaya asam organik dan probiotik.

Karena SCOBY adalah organisme hidup, ia perlu dirawat dengan kondisi yang tepat: suhu ruang yang stabil, kebersihan alat, dan waktu fermentasi yang cukup. Nusa Semaka menjaga setiap tahapan ini dengan saksama agar kualitas kombucha tetap konsisten.', 3, false, '2025-12-15'),
('mitos-vs-fakta-kombucha','Mitos vs Fakta Seputar Kombucha','Edukasi','Kombucha bikin mabuk? Harus diminum tiap hari? Kami luruskan beberapa mitos yang sering beredar di masyarakat.',
'Salah satu mitos yang sering muncul adalah anggapan bahwa kombucha mengandung alkohol tinggi seperti minuman keras. Faktanya, kadar alkohol pada kombucha hasil fermentasi rumahan biasanya sangat rendah, jauh di bawah minuman beralkohol pada umumnya.

Mitos lain menyebutkan kombucha wajib diminum setiap hari agar manfaatnya terasa. Faktanya, konsumsi yang cukup dan konsisten dalam jumlah wajar sudah dapat memberikan manfaat bagi pencernaan.

Nusa Semaka selalu mendorong konsumen untuk mengenali produk yang dikonsumsi, termasuk proses pembuatannya, agar keputusan yang diambil didasari pemahaman yang tepat.', 4, true, '2025-12-22'),
('mengenal-postbiotik','Mengenal Postbiotik: Manfaat Tersembunyi di Balik Kombucha','Edukasi','Selain probiotik, ternyata kombucha juga mengandung postbiotik yang tak kalah bermanfaat bagi tubuh. Apa itu postbiotik?',
'Postbiotik adalah senyawa metabolit aktif yang dihasilkan dari kerja bakteri selama proses fermentasi, seperti asam glukonat, asam laktat, dan berbagai senyawa bioaktif lainnya.

Berbeda dengan probiotik yang merupakan mikroba hidup, postbiotik sudah berupa hasil akhir metabolisme sehingga cenderung lebih stabil disimpan dan tetap memberikan manfaat bagi tubuh, termasuk mendukung kesehatan kulit dan sistem pencernaan.', 4, true, '2026-01-05'),
('nusa-semaka-pasar-tematik-kota-metro','Nusa Semaka Hadir di Pasar Tematik Kota Metro','Kegiatan','Tim Nusa Semaka membuka lapak edukasi dan penjualan produk fermentasi alami dalam Pasar Tematik yang digelar di Kota Metro.',
'Sebagai bagian dari upaya memperkenalkan produk fermentasi alami ke masyarakat yang lebih luas, Nusa Semaka Creativepreneur turut berpartisipasi dalam Pasar Tematik yang diselenggarakan di Kota Metro.

Selain memperkenalkan produk kombucha dan eco-enzyme, tim juga membuka sesi tanya-jawab singkat mengenai manfaat fermentasi bagi kesehatan dan lingkungan kepada pengunjung yang hadir.', 3, true, '2026-01-18')
on conflict (slug) do nothing;

-- Catatan: sekarang pakai "on conflict (question)" karena
-- supabase-schema.sql menambahkan unique index di kolom question,
-- jadi run ulang file ini tidak lagi menghasilkan FAQ duplikat.
insert into public.faq (question, answer, sort_order) values
('Bagaimana cara memesan produk?','Pilih produk yang Anda inginkan, tekan tombol "Tambah ke Pesanan", lalu buka keranjang dan kirim pesanan langsung melalui WhatsApp. Tim kami akan membalas untuk konfirmasi ketersediaan dan pengiriman.',1),
('Apakah ada minimum pembelian?','Tidak ada minimum pembelian. Anda bisa memesan satu produk maupun beberapa produk sekaligus dalam satu pesanan.',2),
('Apakah produk kombucha Nusa Semaka sudah halal?','Ya. Produk minuman fermentasi kami telah melalui proses sesuai standar halal dan dicantumkan pada kemasan.',3),
('Apakah bisa request pelatihan eco-enzyme untuk sekolah atau instansi kami?','Bisa. Kami rutin mengadakan pelatihan untuk sekolah, instansi pemerintah, dan komunitas di seluruh Lampung. Silakan hubungi kami via WhatsApp untuk penjadwalan.',4),
('Berapa lama proses pengiriman?','Estimasi pengiriman akan dikonfirmasi langsung oleh tim kami melalui WhatsApp setelah pesanan diterima, tergantung lokasi Anda.',5),
('Apa metode pembayaran yang tersedia?','Pembayaran dilakukan melalui transfer setelah pesanan dikonfirmasi oleh tim kami via WhatsApp. Kami belum menyediakan pembayaran online di website ini.',6),
('Apa itu eco-enzyme?','Eco-enzyme adalah cairan hasil fermentasi sisa kulit buah dan sayur yang kaya manfaat, digunakan sebagai bahan dasar produk pembersih dan perawatan alami kami.',7)
on conflict (question) do nothing;

insert into public.settings (company_name)
select 'PT Nusa Semaka Creativepreneur'
where not exists (select 1 from public.settings);

insert into public.about_content (hero_title, hero_lead, misi, perjalanan)
select
  'PT Nusa Semaka Creativepreneur',
  'Sebuah perusahaan asal Bandar Lampung yang fokus pada pemberdayaan komunitas, pelatihan, kewirausahaan kreatif, produk ramah lingkungan, dan kegiatan edukatif.',
  '[
    "Memberdayakan masyarakat melalui pelatihan eco-enzyme dan fermentasi.",
    "Menghadirkan produk alami yang ramah lingkungan untuk kebutuhan sehari-hari.",
    "Mendorong ekonomi kreatif berbasis komunitas di seluruh Lampung.",
    "Mengedukasi masyarakat tentang gaya hidup yang lebih berkelanjutan."
  ]'::jsonb,
  '[
    {"title":"Membangun komunitas di Bandar Lampung","desc":"Memulai edukasi fermentasi dan eco-enzyme dari lingkup komunitas lokal."},
    {"title":"Pelatihan Eco-Enzyme & Fruit Enzyme se-Provinsi Lampung","desc":"Menjadi fasilitator pelatihan bagi kader PKK dari berbagai kabupaten/kota di Lampung."},
    {"title":"Berpartisipasi di Pasar Tematik Kota Metro","desc":"Memperkenalkan produk fermentasi alami langsung kepada masyarakat."},
    {"title":"Terus tumbuh bersama komunitas","desc":"Melanjutkan misi pemberdayaan dan produk alami ke lebih banyak wilayah di Lampung."}
  ]'::jsonb
where not exists (select 1 from public.about_content);
