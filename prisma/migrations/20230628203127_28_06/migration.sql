-- CreateTable
CREATE TABLE `ClientBar` (
    `id_cli` INTEGER NOT NULL AUTO_INCREMENT,
    `name_cli` VARCHAR(191) NOT NULL,
    `ap_cli` VARCHAR(191) NOT NULL,
    `tel_cli` VARCHAR(191) NOT NULL,
    `email_cli` VARCHAR(191) NOT NULL,
    `dir_cli` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_cli`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Store` (
    `id_store` INTEGER NOT NULL AUTO_INCREMENT,
    `name_store` VARCHAR(191) NOT NULL,
    `tel_store` VARCHAR(191) NOT NULL,
    `email_store` VARCHAR(191) NOT NULL,
    `dir_store` VARCHAR(191) NOT NULL,
    `rfc_store` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_store`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Staff` (
    `id_staff` INTEGER NOT NULL AUTO_INCREMENT,
    `name_staff` VARCHAR(191) NOT NULL,
    `ap_staff` VARCHAR(191) NOT NULL,
    `tel_staff` VARCHAR(191) NOT NULL,
    `email_staff` VARCHAR(191) NOT NULL,
    `dir_staff` VARCHAR(191) NOT NULL,
    `curp_staff` VARCHAR(191) NOT NULL,
    `rfc_staff` VARCHAR(191) NOT NULL,
    `type_staff` VARCHAR(191) NOT NULL,
    `active_staff` BOOLEAN NOT NULL,
    `date_enter_staff` DATETIME(3) NOT NULL,
    `id_store2` INTEGER NOT NULL,

    PRIMARY KEY (`id_staff`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Provider` (
    `id_pro` INTEGER NOT NULL AUTO_INCREMENT,
    `name_pro` VARCHAR(191) NOT NULL,
    `tel_pro` VARCHAR(191) NOT NULL,
    `email_pro` VARCHAR(191) NOT NULL,
    `dir_pro` VARCHAR(191) NOT NULL,
    `rfc_pro` VARCHAR(191) NOT NULL,
    `date_of_service` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_pro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Stock` (
    `id_stock` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity_stock` INTEGER NOT NULL,
    `id_store1` INTEGER NOT NULL,

    PRIMARY KEY (`id_stock`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderBar` (
    `id_ord` INTEGER NOT NULL AUTO_INCREMENT,
    `total_ord` DOUBLE NOT NULL,
    `iva_ord` DOUBLE NOT NULL,
    `date_ord` DATETIME(3) NOT NULL,
    `id_staff1` INTEGER NOT NULL,
    `id_cli1` INTEGER NOT NULL,

    PRIMARY KEY (`id_ord`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `cat_id` INTEGER NOT NULL AUTO_INCREMENT,
    `type_cat` VARCHAR(191) NOT NULL,
    `des_cat` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`cat_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id_product` INTEGER NOT NULL AUTO_INCREMENT,
    `nom_product` VARCHAR(191) NOT NULL,
    `desc_product` VARCHAR(191) NOT NULL,
    `price_product` DOUBLE NOT NULL,
    `id_stock1` INTEGER NOT NULL,
    `id_pro1` INTEGER NOT NULL,
    `cat_id1` INTEGER NOT NULL,

    PRIMARY KEY (`id_product`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Included` (
    `list_price_include` DOUBLE NOT NULL,
    `quantity_includ` DOUBLE NOT NULL,
    `promo` VARCHAR(191) NULL,
    `id_product1` INTEGER NOT NULL,
    `id_ord1` INTEGER NOT NULL,

    UNIQUE INDEX `Included_id_product1_id_ord1_key`(`id_product1`, `id_ord1`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detalles_prov` (
    `id_detalle` INTEGER NOT NULL,
    `nom_product` VARCHAR(191) NOT NULL,
    `price_product` DOUBLE NOT NULL,
    `type_cat` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_detalle`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vista_Product` (
    `id_product` INTEGER NOT NULL,
    `nom_product` VARCHAR(191) NOT NULL,
    `desc_product` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_product`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Staff` ADD CONSTRAINT `Staff_id_store2_fkey` FOREIGN KEY (`id_store2`) REFERENCES `Store`(`id_store`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stock` ADD CONSTRAINT `Stock_id_store1_fkey` FOREIGN KEY (`id_store1`) REFERENCES `Store`(`id_store`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderBar` ADD CONSTRAINT `OrderBar_id_staff1_fkey` FOREIGN KEY (`id_staff1`) REFERENCES `Staff`(`id_staff`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderBar` ADD CONSTRAINT `OrderBar_id_cli1_fkey` FOREIGN KEY (`id_cli1`) REFERENCES `ClientBar`(`id_cli`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_id_stock1_fkey` FOREIGN KEY (`id_stock1`) REFERENCES `Stock`(`id_stock`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_id_pro1_fkey` FOREIGN KEY (`id_pro1`) REFERENCES `Provider`(`id_pro`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_cat_id1_fkey` FOREIGN KEY (`cat_id1`) REFERENCES `Category`(`cat_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Included` ADD CONSTRAINT `Included_id_product1_fkey` FOREIGN KEY (`id_product1`) REFERENCES `Product`(`id_product`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Included` ADD CONSTRAINT `Included_id_ord1_fkey` FOREIGN KEY (`id_ord1`) REFERENCES `OrderBar`(`id_ord`) ON DELETE RESTRICT ON UPDATE CASCADE;
