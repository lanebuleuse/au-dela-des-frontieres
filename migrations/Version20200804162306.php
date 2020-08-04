<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200804162306 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE continent (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, color VARCHAR(7) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE destination (id INT AUTO_INCREMENT NOT NULL, continent_id INT NOT NULL, picture_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_3EC63EAA921F4C77 (continent_id), UNIQUE INDEX UNIQ_3EC63EAAEE45BDBF (picture_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE media (id INT AUTO_INCREMENT NOT NULL, web_path VARCHAR(255) NOT NULL, local_path VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE stay (id INT AUTO_INCREMENT NOT NULL, destination_id INT NOT NULL, picture_card_id INT DEFAULT NULL, picture_description_id INT DEFAULT NULL, place VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, depart_price VARCHAR(255) NOT NULL, is_with_transport TINYINT(1) NOT NULL, count_people INT NOT NULL, count_overnight_stay INT NOT NULL, type_room VARCHAR(255) NOT NULL, title_description VARCHAR(255) NOT NULL, text_description LONGTEXT NOT NULL, INDEX IDX_5E09839C816C6140 (destination_id), UNIQUE INDEX UNIQ_5E09839C57EA6EF2 (picture_card_id), UNIQUE INDEX UNIQ_5E09839C53328AEE (picture_description_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE stay_media (stay_id INT NOT NULL, media_id INT NOT NULL, INDEX IDX_67DC1DDAFB3AF7D6 (stay_id), INDEX IDX_67DC1DDAEA9FDD75 (media_id), PRIMARY KEY(stay_id, media_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE destination ADD CONSTRAINT FK_3EC63EAA921F4C77 FOREIGN KEY (continent_id) REFERENCES continent (id)');
        $this->addSql('ALTER TABLE destination ADD CONSTRAINT FK_3EC63EAAEE45BDBF FOREIGN KEY (picture_id) REFERENCES media (id)');
        $this->addSql('ALTER TABLE stay ADD CONSTRAINT FK_5E09839C816C6140 FOREIGN KEY (destination_id) REFERENCES destination (id)');
        $this->addSql('ALTER TABLE stay ADD CONSTRAINT FK_5E09839C57EA6EF2 FOREIGN KEY (picture_card_id) REFERENCES media (id)');
        $this->addSql('ALTER TABLE stay ADD CONSTRAINT FK_5E09839C53328AEE FOREIGN KEY (picture_description_id) REFERENCES media (id)');
        $this->addSql('ALTER TABLE stay_media ADD CONSTRAINT FK_67DC1DDAFB3AF7D6 FOREIGN KEY (stay_id) REFERENCES stay (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE stay_media ADD CONSTRAINT FK_67DC1DDAEA9FDD75 FOREIGN KEY (media_id) REFERENCES media (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE destination DROP FOREIGN KEY FK_3EC63EAA921F4C77');
        $this->addSql('ALTER TABLE stay DROP FOREIGN KEY FK_5E09839C816C6140');
        $this->addSql('ALTER TABLE destination DROP FOREIGN KEY FK_3EC63EAAEE45BDBF');
        $this->addSql('ALTER TABLE stay DROP FOREIGN KEY FK_5E09839C57EA6EF2');
        $this->addSql('ALTER TABLE stay DROP FOREIGN KEY FK_5E09839C53328AEE');
        $this->addSql('ALTER TABLE stay_media DROP FOREIGN KEY FK_67DC1DDAEA9FDD75');
        $this->addSql('ALTER TABLE stay_media DROP FOREIGN KEY FK_67DC1DDAFB3AF7D6');
        $this->addSql('DROP TABLE continent');
        $this->addSql('DROP TABLE destination');
        $this->addSql('DROP TABLE media');
        $this->addSql('DROP TABLE stay');
        $this->addSql('DROP TABLE stay_media');
    }
}
