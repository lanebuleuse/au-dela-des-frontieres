<?php

namespace App\Entity;

use App\Repository\StayRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StayRepository::class)
 */
class Stay
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class, inversedBy="stays")
     * @ORM\JoinColumn(nullable=false)
     */
    private $destination;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $place;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $departPrice;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isWithTransport;

    /**
     * @ORM\Column(type="integer")
     */
    private $countPeople;

    /**
     * @ORM\Column(type="integer")
     */
    private $countOvernightStay;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $typeRoom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $titleDescription;

    /**
     * @ORM\Column(type="text")
     */
    private $textDescription;

    /**
     * @ORM\OneToOne(targetEntity=Media::class, cascade={"persist", "remove"})
     */
    private $pictureCard;

    /**
     * @ORM\ManyToMany(targetEntity=Media::class)
     */
    private $picturesSlide;

    /**
     * @ORM\OneToOne(targetEntity=Media::class, cascade={"persist", "remove"})
     */
    private $pictureDescription;

    public function __construct()
    {
        $this->picturesSlide = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDestination(): ?Destination
    {
        return $this->destination;
    }

    public function setDestination(?Destination $destination): self
    {
        $this->destination = $destination;

        return $this;
    }

    public function getPlace(): ?string
    {
        return $this->place;
    }

    public function setPlace(string $place): self
    {
        $this->place = $place;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getDepartPrice(): ?string
    {
        return $this->departPrice;
    }

    public function setDepartPrice(string $departPrice): self
    {
        $this->departPrice = $departPrice;

        return $this;
    }

    public function getIsWithTransport(): ?bool
    {
        return $this->isWithTransport;
    }

    public function setIsWithTransport(bool $isWithTransport): self
    {
        $this->isWithTransport = $isWithTransport;

        return $this;
    }

    public function getCountPeople(): ?int
    {
        return $this->countPeople;
    }

    public function setCountPeople(int $countPeople): self
    {
        $this->countPeople = $countPeople;

        return $this;
    }

    public function getCountOvernightStay(): ?int
    {
        return $this->countOvernightStay;
    }

    public function setCountOvernightStay(int $countOvernightStay): self
    {
        $this->countOvernightStay = $countOvernightStay;

        return $this;
    }

    public function getTypeRoom(): ?string
    {
        return $this->typeRoom;
    }

    public function setTypeRoom(string $typeRoom): self
    {
        $this->typeRoom = $typeRoom;

        return $this;
    }

    public function getTitleDescription(): ?string
    {
        return $this->titleDescription;
    }

    public function setTitleDescription(string $titleDescription): self
    {
        $this->titleDescription = $titleDescription;

        return $this;
    }

    public function getTextDescription(): ?string
    {
        return $this->textDescription;
    }

    public function setTextDescription(string $textDescription): self
    {
        $this->textDescription = $textDescription;

        return $this;
    }

    public function getPictureCard(): ?Media
    {
        return $this->pictureCard;
    }

    public function setPictureCard(?Media $pictureCard): self
    {
        $this->pictureCard = $pictureCard;

        return $this;
    }

    /**
     * @return Collection|Media[]
     */
    public function getPicturesSlide(): Collection
    {
        return $this->picturesSlide;
    }

    public function addPicturesSlide(Media $picturesSlide): self
    {
        if (!$this->picturesSlide->contains($picturesSlide)) {
            $this->picturesSlide[] = $picturesSlide;
        }

        return $this;
    }

    public function removePicturesSlide(Media $picturesSlide): self
    {
        if ($this->picturesSlide->contains($picturesSlide)) {
            $this->picturesSlide->removeElement($picturesSlide);
        }

        return $this;
    }

    public function getPictureDescription(): ?Media
    {
        return $this->pictureDescription;
    }

    public function setPictureDescription(?Media $pictureDescription): self
    {
        $this->pictureDescription = $pictureDescription;

        return $this;
    }
}
