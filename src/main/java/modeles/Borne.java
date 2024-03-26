package modeles;

import java.util.Date;

public class Borne {
    String nom_operateur;

    String contact_operateur;
    String telephone_operateur;
    String nom_station;
    String adresse_station;
    String code_insee_commune;
    String coordonneesXY;
    double puissance_nominale;
    boolean prise_type_ef;
    boolean prise_type_2;
    boolean prise_type_combo_ccs;
    boolean prise_type_chademo;
    boolean prise_type_autre;
    boolean gratuit;
    boolean paiement_acte;
    boolean paiement_cb;
    boolean paiement_autre;
    String tarification;
    String condition_acces;
    boolean reservation;
    String horaires;
    String accessibilité_pmr;
    String restriction_gabarit;
    boolean station_deux_roues;
    String raccordement;
    Date date_mise_en_service;
    String observations;
    Date date_maj;
    double consolidated_longitude;
    double consolidated_latitude;
    String consolidated_commune;


    public Borne(String nom_operateur, String contact_operateur, String telephone_operateur, String nom_station, String adresse_station, String code_insee_commune, String coordonneesXY, double puissance_nominale, boolean prise_type_ef, boolean prise_type_2, boolean prise_type_combo_ccs, boolean prise_type_chademo, boolean prise_type_autre, boolean gratuit, boolean paiement_acte, boolean paiement_cb, boolean paiement_autre, String tarification, String condition_acces, boolean reservation, String horaires, String accessibilité_pmr, String restriction_gabarit, boolean station_deux_roues, String raccordement, Date date_mise_en_service, String observations, Date date_maj, double consolidated_longitude, double consolidated_latitude, String consolidated_commune) {
        this.nom_operateur = nom_operateur;
        this.contact_operateur = contact_operateur;
        this.telephone_operateur = telephone_operateur;
        this.nom_station = nom_station;
        this.adresse_station = adresse_station;
        this.code_insee_commune = code_insee_commune;
        this.coordonneesXY = coordonneesXY;
        this.puissance_nominale = puissance_nominale;
        this.prise_type_ef = prise_type_ef;
        this.prise_type_2 = prise_type_2;
        this.prise_type_combo_ccs = prise_type_combo_ccs;
        this.prise_type_chademo = prise_type_chademo;
        this.prise_type_autre = prise_type_autre;
        this.gratuit = gratuit;
        this.paiement_acte = paiement_acte;
        this.paiement_cb = paiement_cb;
        this.paiement_autre = paiement_autre;
        this.tarification = tarification;
        this.condition_acces = condition_acces;
        this.reservation = reservation;
        this.horaires = horaires;
        this.accessibilité_pmr = accessibilité_pmr;
        this.restriction_gabarit = restriction_gabarit;
        this.station_deux_roues = station_deux_roues;
        this.raccordement = raccordement;
        this.date_mise_en_service = date_mise_en_service;
        this.observations = observations;
        this.date_maj = date_maj;
        this.consolidated_longitude = consolidated_longitude;
        this.consolidated_latitude = consolidated_latitude;
        this.consolidated_commune = consolidated_commune;
    }

    public String getNom_operateur() {
        return (nom_operateur != null) ? nom_operateur : "Non-trouvé";
    }
    public String getContact_operateur() {
        return (contact_operateur != null) ? contact_operateur : "Non-trouvé";
    }

    public String getTelephone_operateur() {
        return (telephone_operateur != null) ? telephone_operateur : "Non-trouvé";
    }

    public String getNom_station() {
        return (nom_station != null) ? nom_station : "Non-trouvé";
    }

    public String getAdresse_station() {
        return (adresse_station != null) ? adresse_station : "Non-trouvé";
    }

    public String getCode_insee_commune() {
        return (code_insee_commune != null) ? code_insee_commune : "Non-trouvé";
    }

    public String getCoordonneesXY() {
        return (coordonneesXY != null) ? coordonneesXY : "Non-trouvé";
    }

    public double getpuissance_nominale() {
        return puissance_nominale;
    }

    public boolean isPrise_type_ef() {
        return prise_type_ef;
    }

    public boolean isPrise_type_2() {
        return prise_type_2;
    }

    public boolean isPrise_type_combo_ccs() {
        return prise_type_combo_ccs;
    }

    public boolean isPrise_type_chademo() {
        return prise_type_chademo;
    }

    public boolean isPrise_type_autre() {
        return prise_type_autre;
    }

    public boolean isGratuit() {
        return gratuit;
    }

    public boolean isPaiement_acte() {
        return paiement_acte;
    }

    public boolean isPaiement_cb() {
        return paiement_cb;
    }

    public boolean isPaiement_autre() {
        return paiement_autre;
    }

    public String getTarification() {
        return (tarification != null) ? tarification : "Non-trouvé";
    }

    public String getCondition_acces() {
        return (condition_acces != null) ? condition_acces : "Non-trouvé";
    }

    public boolean isReservation() {
        return reservation;
    }

    public String getHoraires() {
        return (horaires != null) ? horaires : "Non-trouvé";
    }

    public String getAccessibilité_pmr() {
        return (accessibilité_pmr != null) ? accessibilité_pmr : "Non-trouvé";
    }

    public String getRestriction_gabarit() {
        return (restriction_gabarit != null) ? restriction_gabarit : "Non-trouvé";
    }

    public boolean isStation_deux_roues() {
        return station_deux_roues;
    }

    public String getraccordement() {
        return (raccordement != null) ? raccordement : "Non-trouvé";
    }

    public Date getDate_mise_en_service() {
        return date_mise_en_service;
    }

    public String getObservations() {
        return (observations != null) ? observations : "Non-trouvé";
    }

    public Date getDate_maj() {
        return date_maj;
    }

    public double getConsolidated_longitude() {
        return consolidated_longitude;
    }

    public double getConsolidated_latitude() {
        return consolidated_latitude;
    }

    public String getConsolidated_commune() {
        return (consolidated_commune != null) ? consolidated_commune : "Non-trouvé";
    }
}