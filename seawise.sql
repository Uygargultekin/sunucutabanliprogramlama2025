

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `seawise`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `companies_1`
--

DROP TABLE IF EXISTS `companies_1`;
CREATE TABLE IF NOT EXISTS `companies_1` (
  `id` varchar(36) NOT NULL,
  `name` varchar(13) DEFAULT NULL,
  `email` varchar(26) DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  `rating_avg` decimal(3,2) DEFAULT NULL,
  `total_shipments` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `companies_1`
--

INSERT INTO `companies_1` (`id`, `name`, `email`, `created_at`, `rating_avg`, `total_shipments`) VALUES
('11111111-1111-1111-1111-111111111111', 'Test Şirket 1', 'test_company_1@example.com', '2024-12-24 00:49:51.635446+00', '0.00', 0),
('22222222-2222-2222-2222-222222222222', 'Test Şirket 1', 'test1@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('33333333-3333-3333-3333-333333333333', 'Test Şirket 2', 'test2@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('44444444-4444-4444-4444-444444444444', 'Test Şirket 3', 'test3@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('55555555-5555-5555-5555-555555555555', 'Test Şirket 4', 'test4@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('66666666-6666-6666-6666-666666666666', 'Test Şirket 5', 'test5@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('77777777-7777-7777-7777-777777777777', 'Test Şirket 6', 'test6@example.com', '2024-12-23 20:23:25.226923+00', '0.00', 0),
('9beee061-5b54-4728-b43a-bbcea0da601f', 'Admin', 'uygar.gultekin@admin.com', '2024-12-24 02:43:56.792206+00', '0.00', 0),
('cac7032b-db35-4fc9-a450-7d0f1789cb70', 'test', 'test@firma.com', '2024-12-23 16:33:15.093521+00', '0.00', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `logistique_companies`
--

DROP TABLE IF EXISTS `logistique_companies`;
CREATE TABLE IF NOT EXISTS `logistique_companies` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(271) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `total_shipments` int DEFAULT NULL,
  `specialties` varchar(40) DEFAULT NULL,
  `created_at` varchar(28) DEFAULT NULL,
  `founded_year` int DEFAULT NULL,
  `fleet_size` int DEFAULT NULL,
  `headquarters` varchar(8) DEFAULT NULL,
  `website` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `logistique_companies`
--

INSERT INTO `logistique_companies` (`id`, `name`, `description`, `rating`, `total_shipments`, `specialties`, `created_at`, `founded_year`, `fleet_size`, `headquarters`, `website`) VALUES
('2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'Yıldız Global Shipping', '2001 yılından beri premium araç taşımacılığında uzmanlaşmış lider firma. 50 özel Ro-Ro gemisiyle Avrupa\'nın önde gelen otomotiv üreticilerine hizmet veriyor. Modern filo ve ekipmanlarla %98 müşteri memnuniyeti. VDA 6.2 ve ECG kalite sertifikalarına sahip.', '4.60', 720, '[\"Ro-Ro\",\"Araç Taşıma\"]', '2024-12-23 01:46:55.27966+00', 2001, 50, 'İstanbul', 'www.yildizshipping.com'),
('781088f1-b5d7-4253-82e5-edc18d0901aa', 'Karadeniz Shipping', '1997\'de kurulan firma, dökme yük taşımacılığında faaliyet gösteriyor. 40 gemiden oluşan filosuna rağmen %45 gecikme oranı ve sık yaşanan dokümantasyon hataları nedeniyle düşük performans. Özellikle tahıl ve maden taşımacılığında operasyonel sorunlar yaşıyor.', '2.60', 150, '[\"Dökme Yük\",\"Genel Kargo\"]', '2024-12-23 01:46:55.27966+00', 1997, 40, 'Samsun', 'www.karadenizshipping.com'),
('a9b72d8b-e85b-4bda-998d-405e72886c60', 'Akdeniz Lojistik', '1992\'de kurulan firma, proje kargo ve ağır yük taşımacılığında faaliyet gösteriyor. 30 gemiden oluşan filosuyla hizmet veren şirket, son dönemde %25 gecikme oranı ve koordinasyon sorunları yaşıyor. Özellikle rüzgar türbini ve enerji ekipmanları taşımacılığında deneyimli.', '3.40', 280, '[\"Ağır Yük\",\"Proje Kargo\"]', '2024-12-23 01:46:55.27966+00', 1992, 30, 'Mersin', 'www.akdenizlojistik.com'),
('c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'Mavi Deniz Lojistik', '1995\'ten beri soğuk zincir ve konteyner taşımacılığında sektör lideri. Modern filo ve ileri teknoloji altyapısıyla %99.8 zamanında teslimat oranı. ISO 9001, GDP ve CEIV Pharma sertifikaları ile ilaç ve gıda lojistiğinde öncü. 45 gemiden oluşan özel filoya sahip.', '4.80', 850, '[\"Konteyner\",\"Dökme Yük\",\"Soğuk Zincir\"]', '2024-12-23 01:46:55.27966+00', 1995, 45, 'İstanbul', 'www.mavideniz.com'),
('ff26360b-1a26-4dcd-bacb-925396f7c503', 'Atlas Denizcilik', '1988\'de kurulan firma, tehlikeli madde taşımacılığında 35 yıllık deneyime sahip. Son dönemde yaşanan operasyonel sorunlar ve %40 gecikme oranı nedeniyle müşteri memnuniyetinde düşüş. Yeniden yapılanma sürecinde. ADR ve IMDG sertifikaları mevcut.', '2.90', 180, '[\"Tehlikeli Madde\",\"Proje Kargo\"]', '2024-12-23 01:46:55.27966+00', 1988, 35, 'İzmir', 'www.atlasdenizcilik.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `partner_certifications`
--

DROP TABLE IF EXISTS `partner_certifications`;
CREATE TABLE IF NOT EXISTS `partner_certifications` (
  `id` varchar(36) NOT NULL,
  `logistics_company_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(23) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `issue_date` varchar(10) DEFAULT NULL,
  `expiry_date` varchar(10) DEFAULT NULL,
  `description` varchar(62) DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`logistics_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `partner_certifications`
--

INSERT INTO `partner_certifications` (`id`, `logistics_company_id`, `name`, `issuer`, `issue_date`, `expiry_date`, `description`, `created_at`) VALUES
('104148e5-c6a8-4829-945b-29e09dac039a', '781088f1-b5d7-4253-82e5-edc18d0901aa', 'ISO 22000:2018', 'Bureau Veritas', '2022-08-15', '2023-08-14', 'Gıda güvenliği yönetim sistemi sertifikası', '2024-12-24 02:35:20.263485+00'),
('1367255d-12e7-4e9a-adae-775837d0b458', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'ISO 9001:2015', 'Bureau Veritas', '2022-06-01', '2025-05-31', 'Kalite yönetim sistemi sertifikası', '2024-12-24 02:35:20.263485+00'),
('21dda127-71e6-44a1-963b-f203c218abbf', 'a9b72d8b-e85b-4bda-998d-405e72886c60', 'Heavy Lift Certificate', 'DNV GL', '2023-03-20', '2024-03-19', 'Ağır yük taşımacılığı yetkinlik sertifikası', '2024-12-24 02:35:20.263485+00'),
('5d94eacf-d44e-4af2-94a3-3a104c5b6442', '2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'ECG Quality Certificate', 'European Car Transport Group', '2023-04-15', '2026-04-14', 'Araç lojistiği kalite sertifikası', '2024-12-24 02:35:20.263485+00'),
('981a5a47-be6a-4576-93d0-627fe9b21eb1', 'ff26360b-1a26-4dcd-bacb-925396f7c503', 'IMDG Code Certificate', 'IMO', '2023-02-15', '2024-02-14', 'Uluslararası Denizcilik Tehlikeli Maddeler Kodu sertifikası', '2024-12-24 02:35:20.263485+00'),
('9c7c7851-0209-4062-9c6c-67df97519786', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'CEIV Pharma', 'IATA', '2023-01-15', '2026-01-14', 'İlaç taşımacılığı için en üst düzey uluslararası sertifikasyon', '2024-12-24 02:35:20.263485+00'),
('bf36c0db-031d-47dd-a475-e916d109727d', '781088f1-b5d7-4253-82e5-edc18d0901aa', 'GAFTA Certificate', 'The Grain and Feed Trade Association', '2023-04-01', '2024-03-31', 'Tahıl ve yem ticareti kalite standardı sertifikası', '2024-12-24 02:35:20.263485+00'),
('c91a2e2e-de61-47f9-b79f-7e37a72cf90c', '2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'VDA 6.2', 'German Association of the Automotive Industry', '2023-01-10', '2026-01-09', 'Otomotiv lojistiği kalite yönetim sistemi sertifikası', '2024-12-24 02:35:20.263485+00'),
('d6b8fdce-b91a-4440-9a66-fc80336468ec', 'a9b72d8b-e85b-4bda-998d-405e72886c60', 'ISO 14001:2015', 'Bureau Veritas', '2022-07-01', '2023-06-30', 'Çevre yönetim sistemi sertifikası', '2024-12-24 02:35:20.263485+00'),
('f2d52bf0-8ced-4801-82fa-9f2c879365d4', 'ff26360b-1a26-4dcd-bacb-925396f7c503', 'ADR Sertifikası', 'Ulaştırma Bakanlığı', '2023-01-01', '2023-12-31', 'Tehlikeli madde taşımacılığı yetkinlik sertifikası', '2024-12-24 02:35:20.263485+00'),
('fcb6459b-e4d9-47bb-a2b8-8882cc2a8fc1', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'GDP', 'World Health Organization', '2023-03-01', '2026-02-28', 'İlaç ve sağlık ürünleri dağıtımı için uluslararası standart', '2024-12-24 02:35:20.263485+00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `partner_references`
--

DROP TABLE IF EXISTS `partner_references`;
CREATE TABLE IF NOT EXISTS `partner_references` (
  `id` varchar(36) NOT NULL,
  `logistics_company_id` varchar(36) DEFAULT NULL,
  `company_name` varchar(19) DEFAULT NULL,
  `project_description` varchar(47) DEFAULT NULL,
  `cargo_types` varchar(30) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `testimonial` varchar(146) DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`logistics_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `partner_references`
--

INSERT INTO `partner_references` (`id`, `logistics_company_id`, `company_name`, `project_description`, `cargo_types`, `year`, `testimonial`, `created_at`) VALUES
('0bb73bea-5117-49ab-aa9c-e5feb5c6d51f', '781088f1-b5d7-4253-82e5-edc18d0901aa', 'ETİ Maden', 'Maden ürünleri ihracatı', '[\"Dökme Yük\",\"Maden\"]', 2023, 'Dokümantasyon hataları ve iletişim eksiklikleri nedeniyle büyük zaman kayıpları yaşadık. Operasyonel süreçlerde acil iyileştirme gerekli.', '2024-12-24 02:35:20.263485+00'),
('1de941df-5f5e-49d9-bd18-1eaa9252f21c', '2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'Mercedes-Benz Türk', 'Premium araç ihracatı', '[\"Otomotiv\",\"Ro-Ro\"]', 2023, '5 yıllık iş birliğimizde 10,000+ premium araç taşıması, sıfır hasar oranı. Özel ekipman ve uzman ekipleriyle kusursuz hizmet.', '2024-12-24 02:35:20.263485+00'),
('2270478d-ba29-48c4-8943-2e925d5e4353', '2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'Porsche Türkiye', 'Koleksiyon araçları taşıma', '[\"Otomotiv\",\"Özel Taşıma\"]', 2023, 'Klasik ve özel üretim araçların taşınmasında gösterdikleri hassasiyet ve uzmanlık takdire şayan.', '2024-12-24 02:35:20.263485+00'),
('34989a84-3c20-41bb-8641-f98bd66a6a76', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'Unilever Türkiye', 'Avrupa genelinde soğuk zincir gıda taşımacılığı', '[\"Gıda\",\"Soğuk Zincir\"]', 2023, 'Son 3 yılda 500\'den fazla sevkiyatta sıfır sıcaklık sapması ve %100 zamanında teslimat. Soğuk zincir yönetiminde mükemmel performans.', '2024-12-24 02:35:20.263485+00'),
('552fbe6e-7ee0-4029-989b-886f19e894bc', 'a9b72d8b-e85b-4bda-998d-405e72886c60', 'Vestas Türkiye', 'Rüzgar türbini taşıma projesi', '[\"Ağır Yük\",\"Proje Kargo\"]', 2023, 'Ekipman ve operasyonel yetkinlikleri iyi ancak proje yönetimi ve iletişimde önemli eksiklikler var. %25 oranında gecikme yaşanıyor.', '2024-12-24 02:35:20.263485+00'),
('561043ea-faf4-4e0c-b765-d622da9dbe7b', 'a9b72d8b-e85b-4bda-998d-405e72886c60', 'GE Renewable Energy', 'Enerji santrali ekipmanları taşıma', '[\"Ağır Yük\",\"Proje Kargo\"]', 2023, 'Ağır yük taşıma kapasitesi yeterli fakat planlama ve koordinasyon sorunları nedeniyle projeler uzuyor.', '2024-12-24 02:35:20.263485+00'),
('58e3ed83-d384-4eae-af8d-7d51a77a41d0', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'Pfizer Türkiye', 'COVID-19 aşıları ve hassas ilaç lojistiği', '[\"İlaç\",\"Soğuk Zincir\"]', 2023, 'Ultra soğuk zincir gerektiren aşı taşımalarında bile sıfır hata. GDP standartlarına tam uyum ve profesyonel ekip yönetimi.', '2024-12-24 02:35:20.263485+00'),
('5daf3387-dab5-4664-aec1-bb6efdddc684', '2a6be97f-6dc1-4d55-a5e6-270a2d654f7c', 'BMW Türkiye', 'Lüks araç lojistiği', '[\"Otomotiv\",\"Özel Taşıma\"]', 2023, 'Premium araçlarımızın taşınmasında %100 başarı. Özel sigorta kapsamı ve profesyonel ekip yönetimi mükemmel.', '2024-12-24 02:35:20.263485+00'),
('71920a88-5dab-4e09-b6af-8c848f955bac', 'ff26360b-1a26-4dcd-bacb-925396f7c503', 'Petkim', 'Petrokimya ürünleri taşıma projesi', '[\"Kimyasal\",\"Tehlikeli Madde\"]', 2023, 'Tehlikeli madde taşıma tecrübesi iyi ancak son dönemde artan operasyonel sorunlar ve dokümantasyon hataları endişe verici.', '2024-12-24 02:35:20.263485+00'),
('86e2bbaf-f09c-4e2e-963a-8e0d54da26e5', '781088f1-b5d7-4253-82e5-edc18d0901aa', 'TMO', 'Tahıl taşımacılığı projesi', '[\"Dökme Yük\",\"Tahıl\"]', 2023, 'Sürekli yaşanan gecikmeler ve operasyonel sorunlar nedeniyle ciddi aksamalar yaşandı. %45 oranında teslimat gecikmesi kabul edilemez.', '2024-12-24 02:35:20.263485+00'),
('93df09ae-54b2-4194-a89e-a40463caf7eb', '781088f1-b5d7-4253-82e5-edc18d0901aa', 'Cargill Türkiye', 'Tahıl ve yem ürünleri taşımacılığı', '[\"Dökme Yük\",\"Tahıl\"]', 2023, 'Filo kapasitesi yeterli olmasına rağmen süreç yönetimi ve dokümantasyon konularında ciddi eksiklikler var. Teslimat performansı çok düşük.', '2024-12-24 02:35:20.263485+00'),
('aab8b873-45fd-432e-98f8-197bbd8037fd', 'a9b72d8b-e85b-4bda-998d-405e72886c60', 'Siemens Gamesa', 'Türbin kanatları taşıma projesi', '[\"Ağır Yük\",\"Proje Kargo\"]', 2023, 'Özel ekipman kullanımı ve teknik yetkinlik iyi seviyede ancak proje takibi ve raporlama süreçlerinde iyileştirme gerekli.', '2024-12-24 02:35:20.263485+00'),
('aee96fb7-5420-4090-9fe9-d7700b232d22', 'ff26360b-1a26-4dcd-bacb-925396f7c503', 'BASF Türkiye', 'Tehlikeli kimyasal madde taşımacılığı', '[\"Kimyasal\",\"Tehlikeli Madde\"]', 2023, 'Son 6 ayda yaşanan gecikmeler ve dokümantasyon hataları ciddi sorunlara yol açtı. ADR standartlarına uyum iyi ancak operasyonel süreçler yetersiz.', '2024-12-24 02:35:20.263485+00'),
('d6ff370c-f86b-47f6-8a1c-e9ff68a84a9d', 'ff26360b-1a26-4dcd-bacb-925396f7c503', 'Henkel Türkiye', 'Endüstriyel kimyasal taşımacılığı', '[\"Kimyasal\",\"Tehlikeli Madde\"]', 2023, 'Güvenlik protokolleri yeterli ancak %40 oranında yaşanan gecikmeler ve iletişim eksiklikleri operasyonlarımızı aksatıyor.', '2024-12-24 02:35:20.263485+00'),
('e79078ba-6cef-4112-9619-d176bb8076e7', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', 'Nestlé Türkiye', 'Dondurulmuş gıda lojistiği', '[\"Gıda\",\"Soğuk Zincir\"]', 2023, '3 yıllık iş birliğimizde 1000+ sevkiyat, %99.9 zamanında teslimat. Sıcaklık takibi ve raporlama sistemleri örnek niteliğinde.', '2024-12-24 02:35:20.263485+00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shipments`
--

DROP TABLE IF EXISTS `shipments`;
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` varchar(36) NOT NULL,
  `company_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cargo_type` varchar(20) DEFAULT NULL,
  `cargo_weight` int DEFAULT NULL,
  `departure_port` varchar(5) DEFAULT NULL,
  `arrival_port` varchar(5) DEFAULT NULL,
  `status` varchar(9) DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  `updated_at` varchar(29) DEFAULT NULL,
  `width` varchar(3) DEFAULT NULL,
  `height` varchar(3) DEFAULT NULL,
  `length` varchar(3) DEFAULT NULL,
  `stackable` varchar(5) DEFAULT NULL,
  `hazardous` varchar(5) DEFAULT NULL,
  `special_requirements` varchar(26) DEFAULT NULL,
  `logistics_company_id` varchar(36) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `contact_person` varchar(14) DEFAULT NULL,
  `contact_phone` varchar(16) DEFAULT NULL,
  `contact_email` varchar(24) DEFAULT NULL,
  `contact_notes` varchar(10) DEFAULT NULL,
  `volume` int DEFAULT NULL,
  `packaging` varchar(13) DEFAULT NULL,
  `temperature_controlled` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `shipments`
--

INSERT INTO `shipments` (`id`, `company_id`, `cargo_type`, `cargo_weight`, `departure_port`, `arrival_port`, `status`, `created_at`, `updated_at`, `width`, `height`, `length`, `stackable`, `hazardous`, `special_requirements`, `logistics_company_id`, `weight`, `contact_person`, `contact_phone`, `contact_email`, `contact_notes`, `volume`, `packaging`, `temperature_controlled`) VALUES
('439de1ca-038a-44fa-9e63-1e392f4986d4', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Otomotiv Parçaları', 6000, 'TRSMS', 'ITGIT', 'completed', '2024-12-14 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Just-in-time teslimat', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 30, '40\' High Cube', 'false'),
('4f723e93-5395-4dea-ab9a-8726224195cc', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Soğuk Zincir - İlaç', 3000, 'TRIST', 'DEHAM', 'active', '2024-12-19 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Sıcaklık kontrolü (-2°C)', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 18, '20\' Reefer', 'true'),
('6194d801-5e58-4aa2-9088-90ebb05ef3ab', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Otomotiv Yedek Parça', 7000, 'TRMER', 'NLRTM', 'active', '2024-12-21 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Express teslimat', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 35, '40\' High Cube', 'false'),
('76d0247a-78e0-4516-b072-89f30c3f24be', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Genel Kargo', 900, 'TRIST', 'ESBCN', 'pending', '2024-12-24 02:43:56.958121+00', '2024-12-24 02:43:56.958121+00', '900', '900', '900', 'false', 'false', '', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', '', '', '', '', 729, '40\' Konteyner', 'false'),
('7717b1bd-9a7d-4f5b-a1f5-24069016e2a1', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Konteyner - Tekstil', 8000, 'TRMER', 'DEHAM', 'completed', '2024-11-29 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Standart konteyner', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 40, '40\' Standart', 'false'),
('88b3ddba-1bf3-4aab-b023-b330aee2ab7e', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Genel Kargo', 900, 'TRIST', 'DEHAM', 'cancelled', '2024-12-24 08:26:24.258574+00', '2024-12-24 08:26:32.519+00', '900', '900', '900', 'false', 'true', '', 'ff26360b-1a26-4dcd-bacb-925396f7c503', '', '', '', '', '', 729, '40\' Konteyner', 'false'),
('8dbb066e-cbb9-48a9-b90b-ae9f400107cc', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Elektronik', 3500, 'TRIZM', 'GRPIR', 'completed', '2024-12-09 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Hassas kargo', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 20, '20\' Standart', 'false'),
('bbe8a7bc-92f9-42e3-b366-afdb4606dc83', '9beee061-5b54-4728-b43a-bbcea0da601f', 'İlaç', 2000, 'TRIST', 'ESBCN', 'completed', '2024-12-04 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'GDP standartlarında taşıma', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 15, '20\' Reefer', 'true'),
('d6e3210a-9016-40b3-9f9b-f9bbab9cedb4', '9beee061-5b54-4728-b43a-bbcea0da601f', 'Soğuk Zincir - Gıda', 5000, 'TRIST', 'NLRTM', 'completed', '2024-11-24 08:34:58.128689+00', '2024-12-24 08:34:58.128689+00', '', '', '', 'true', 'false', 'Sıcaklık kontrolü (-18°C)', 'c6f03e96-3530-4df9-8a5e-0afa399a9f21', '', 'Uygar Gültekin', '+90 555 123 4567', 'uygar.gultekin@admin.com', '', 25, '40\' Reefer', 'true');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `partner_certifications`
--
ALTER TABLE `partner_certifications`
  ADD CONSTRAINT `partner_certifications_ibfk_1` FOREIGN KEY (`logistics_company_id`) REFERENCES `logistique_companies` (`id`);

--
-- Tablo kısıtlamaları `partner_references`
--
ALTER TABLE `partner_references`
  ADD CONSTRAINT `partner_references_ibfk_1` FOREIGN KEY (`logistics_company_id`) REFERENCES `logistique_companies` (`id`);

--
-- Tablo kısıtlamaları `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies_1` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
