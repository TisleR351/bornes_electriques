package classes;

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
        return nom_operateur;
    }

    public void setNom_operateur(String nom_operateur) {
        this.nom_operateur = nom_operateur;
    }

    public String getContact_operateur() {
        return contact_operateur;
    }

    public void setContact_operateur(String contact_operateur) {
        this.contact_operateur = contact_operateur;
    }

    public String getTelephone_operateur() {
        return telephone_operateur;
    }

    public void setTelephone_operateur(String telephone_operateur) {
        this.telephone_operateur = telephone_operateur;
    }

    public String getNom_station() {
        return nom_station;
    }

    public void setNom_station(String nom_station) {
        this.nom_station = nom_station;
    }

    public String getAdresse_station() {
        return adresse_station;
    }

    public void setAdresse_station(String adresse_station) {
        this.adresse_station = adresse_station;
    }

    public String getCode_insee_commune() {
        return code_insee_commune;
    }

    public void setCode_insee_commune(String code_insee_commune) {
        this.code_insee_commune = code_insee_commune;
    }

    public String getCoordonneesXY() {
        return coordonneesXY;
    }

    public void setCoordonneesXY(String coordonneesXY) {
        this.coordonneesXY = coordonneesXY;
    }

    public double getpuissance_nominale() {
        return puissance_nominale;
    }

    public void setpuissance_nominale(double puissance_nominale) {
        this.puissance_nominale = puissance_nominale;
    }

    public boolean isPrise_type_ef() {
        return prise_type_ef;
    }

    public void setPrise_type_ef(boolean prise_type_ef) {
        this.prise_type_ef = prise_type_ef;
    }

    public boolean isPrise_type_2() {
        return prise_type_2;
    }

    public void setPrise_type_2(boolean prise_type_2) {
        this.prise_type_2 = prise_type_2;
    }

    public boolean isPrise_type_combo_ccs() {
        return prise_type_combo_ccs;
    }

    public void setPrise_type_combo_ccs(boolean prise_type_combo_ccs) {
        this.prise_type_combo_ccs = prise_type_combo_ccs;
    }

    public boolean isPrise_type_chademo() {
        return prise_type_chademo;
    }

    public void setPrise_type_chademo(boolean prise_type_chademo) {
        this.prise_type_chademo = prise_type_chademo;
    }

    public boolean isPrise_type_autre() {
        return prise_type_autre;
    }

    public void setPrise_type_autre(boolean prise_type_autre) {
        this.prise_type_autre = prise_type_autre;
    }

    public boolean isGratuit() {
        return gratuit;
    }

    public void setGratuit(boolean gratuit) {
        this.gratuit = gratuit;
    }

    public boolean isPaiement_acte() {
        return paiement_acte;
    }

    public void setPaiement_acte(boolean paiement_acte) {
        this.paiement_acte = paiement_acte;
    }

    public boolean isPaiement_cb() {
        return paiement_cb;
    }

    public void setPaiement_cb(boolean paiement_cb) {
        this.paiement_cb = paiement_cb;
    }

    public boolean isPaiement_autre() {
        return paiement_autre;
    }

    public void setPaiement_autre(boolean paiement_autre) {
        this.paiement_autre = paiement_autre;
    }

    public String getTarification() {
        return tarification;
    }

    public void setTarification(String tarification) {
        this.tarification = tarification;
    }

    public String getCondition_acces() {
        return condition_acces;
    }

    public void setCondition_acces(String condition_acces) {
        this.condition_acces = condition_acces;
    }

    public boolean isReservation() {
        return reservation;
    }

    public void setReservation(boolean reservation) {
        this.reservation = reservation;
    }

    public String getHoraires() {
        return horaires;
    }

    public void setHoraires(String horaires) {
        this.horaires = horaires;
    }

    public String getAccessibilité_pmr() {
        return accessibilité_pmr;
    }

    public void setAccessibilité_pmr(String accessibilité_pmr) {
        this.accessibilité_pmr = accessibilité_pmr;
    }

    public String getRestriction_gabarit() {
        return restriction_gabarit;
    }

    public void setRestriction_gabarit(String restriction_gabarit) {
        this.restriction_gabarit = restriction_gabarit;
    }

    public boolean isStation_deux_roues() {
        return station_deux_roues;
    }

    public void setStation_deux_roues(boolean station_deux_roues) {
        this.station_deux_roues = station_deux_roues;
    }

    public String getraccordement() {
        return raccordement;
    }

    public void setraccordement(String raccordement) {
        this.raccordement = raccordement;
    }

    public Date getDate_mise_en_service() {
        return date_mise_en_service;
    }

    public void setDate_mise_en_service(Date date_mise_en_service) {
        this.date_mise_en_service = date_mise_en_service;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public Date getDate_maj() {
        return date_maj;
    }

    public void setDate_maj(Date date_maj) {
        this.date_maj = date_maj;
    }

    public double getConsolidated_longitude() {
        return consolidated_longitude;
    }

    public void setConsolidated_longitude(double consolidated_longitude) {
        this.consolidated_longitude = consolidated_longitude;
    }

    public double getConsolidated_latitude() {
        return consolidated_latitude;
    }

    public void setConsolidated_latitude(double consolidated_latitude) {
        this.consolidated_latitude = consolidated_latitude;
    }

    public String getConsolidated_commune() {
        return consolidated_commune;
    }

    public void setConsolidated_commune(String consolidated_commune) {
        this.consolidated_commune = consolidated_commune;
    }
}
