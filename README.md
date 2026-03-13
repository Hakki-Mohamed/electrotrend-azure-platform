#  ElectroTrend Azure Platform
> Plateforme de données hybride Cloud + Microsoft Stack pour l'analyse des ventes mondiales Apple (2022–2024)

![Azure](https://img.shields.io/badge/Azure-Cloud-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![SSIS](https://img.shields.io/badge/SSIS-ETL-orange)
![SQL](https://img.shields.io/badge/SQL-Database-red)

---

##  Description du projet

ElectroTrend est une entreprise internationale spécialisée dans la distribution de produits technologiques. Ce projet met en place une plateforme analytique moderne permettant de :

-  Centraliser **11 500 transactions** de ventes mondiales Apple
-  Analyser la performance par **47 pays / 514+ villes**
-  Évaluer l'impact des **remises** sur les volumes
-  Analyser les **retours produits**
-  Mesurer la performance par **canal de vente**
-  Segmenter les **clients** par rentabilité

---

##  Architecture
```
[CSV Source]
     │
     ▼
[Azure Blob Storage]      ← Landing Zone (couche Bronze)
     │
     ▼
[Azure Data Factory]      ← Orchestration du pipeline
     │
     ▼
[SSIS Package (.dtsx)]    ← Nettoyage & Transformation (couche Silver)
     │
     ▼
[Azure SQL Database]      ← Data Warehouse modèle en étoile (couche Gold)
     │
     ▼
[Power BI Dashboard]      ← Visualisation & KPI décisionnels
```

---

##  Équipe

| Membre | Rôle | Responsabilité |
|--------|------|----------------|
| Apprenant 1 | Binôme 1 | Architecture, Blob Storage, ADF, Documentation |
| Apprenant 2 | Binôme 1 | Package SSIS ETL |
| Apprenant 3 | Binôme 2 | Fact_Sales, Chargement DW |
| Apprenant 4 | Binôme 2 | Tables Dimensions, Optimisation |
| Apprenant 5 & 6 | Binôme 3| SSAS Tabular, Power BI, Présentation |

---

##  Structure du repository
```
electrotrend-azure-platform/
├──  README.md
├──  .gitignore
├──  docs/
│   ├── Rapport_Azure_ElectroTrend_Complet.docx
│   ├── architecture_diagram.png
│   └── architecture_alternative/
├──  data/
│   └── sample/
│       └── apple_global_sales_sample.csv
├──  blob-storage/
│   └── landing-zone-structure.md
├──  adf/
│   ├── pipelines/
│   │   └── pl_ingest_apple_sales.json
│   ├── linked-services/
│   │   ├── ls_blob_storage.json
│   │   └── ls_sql_staging.json
│   ├── datasets/
│   │   ├── ds_source_csv.json
│   │   └── ds_staging_sql.json
│   └── triggers/
│       └── tr_daily_schedule.json
├──  ssis/
│   ├── ElectroTrend_ETL.dtsx
│   └── README.md
├──  sql/
│   ├── staging/
│   │   ├── 01_create_stg_sales.sql
│   │   └── 02_clean_stg_sales.sql
│   └── datawarehouse/
│       ├── 03_create_dim_date.sql
│       ├── 04_create_dim_product.sql
│       ├── 05_create_dim_geography.sql
│       ├── 06_create_dim_channel.sql
│       ├── 07_create_dim_customer_segment.sql
│       ├── 08_create_fact_sales.sql
│       └── 09_load_fact_sales.sql
├──  ssas/
│   ├── ElectroTrend_Model.bim
│   └── measures.md
├──  powerbi/
│   ├── ElectroTrend_Dashboard.pbix
│   └── screenshots/
└──  presentation/
    └── ElectroTrend_Slides.pptx
```

---

##  Dataset

| Propriété | Valeur |
|-----------|--------|
| Fichier | `apple_global_sales_dataset.csv` |
| Transactions | 11 500 lignes |
| Colonnes | 27 colonnes |
| Pays | 47 pays |
| Villes | 514+ villes |
| Produits | 43 produits Apple |
| Période | 2022 – 2024 |

---

##  Modèle en étoile
```
              [Dim_Date]
                  │
  [Dim_Channel] ──┤
                  │
  [Dim_Product] ──┼──── [Fact_Sales]
                  │
[Dim_Geography] ──┤
                  │
[Dim_CustomerSegment]
```

---

##  Stack technique

| Service | Rôle |
|---------|------|
| Azure Blob Storage | Landing Zone — stockage CSV brut |
| Azure Data Factory | Orchestration pipeline ETL |
| SSIS | Nettoyage et transformation des données |
| Azure SQL Database | Data Warehouse modèle en étoile |
| SSAS Tabular | Modèle sémantique et mesures DAX |
| Power BI | Dashboard décisionnel interactif |

---

##  Installation et déploiement

### Prérequis
- Compte Azure actif
- Visual Studio 2022 + extension SSIS
- Power BI Desktop
- SQL Server Management Studio (SSMS)

### Étapes

**1. Cloner le repository**
```bash
git clone https://github.com/Hakki-Mohamed/electrotrend-azure-platform.git
cd electrotrend-azure-platform
```

**2. Azure Blob Storage**
```
- Créer un Storage Account
- Créer le container landing-zone/raw/
- Uploader apple_global_sales_dataset.csv
```

**3. Azure Data Factory**
```
- Importer le pipeline depuis adf/pipelines/
- Configurer les Linked Services
- Exécuter le pipeline pl_ingest_apple_sales
```

**4. SSIS**
```
- Ouvrir ssis/ElectroTrend_ETL.dtsx dans Visual Studio 2022
- Configurer la connexion SQL
- Exécuter le package
```

**5. Data Warehouse**
```
- Exécuter les scripts SQL dans sql/staging/
- Exécuter les scripts SQL dans sql/datawarehouse/
```

**6. Power BI**
```
- Ouvrir powerbi/ElectroTrend_Dashboard.pbix
- Configurer la connexion SQL Database
- Actualiser les données
```

---

##  KPI et analyses métier

| Question métier | KPI |
|----------------|-----|
| Quel pays génère le plus de revenu ? | Total Revenue by Country |
| Quelle catégorie domine par région ? | Revenue by Category/Region |
| Quel canal est le plus performant ? | Channel Performance |
| Les remises augmentent-elles le volume ? | Discount vs Units Sold |
| Quel segment client est le plus rentable ? | Revenue by Segment |
| Analyse saisonnière Q4 ? | Revenue by Quarter |
| Taux de retour par produit ? | Return Rate % |

---

##  Budget Azure

| Ressource | Coût estimé |
|-----------|-------------|
| Azure Blob Storage | ~0.50€ |
| Azure Data Factory | ~1.00€ |
| Azure SQL Database | ~2.00€ |
| Azure Synapse | ~1.00€ |
| **Total** | **≤ 5€** |

---

##  Planning

| Sprint | Période | Objectif |
|--------|---------|----------|
| Sprint 1 | J1 → J3 | Setup Azure + Rapport + Architecture |
| Sprint 2 | J4 → J6 | Pipeline ADF + SSIS + Data Warehouse |
| Sprint 3 | J7 → J9 | SSAS + Power BI + Présentation |

---

##  Livrables

-  Rapport Azure (8–12 pages)
-  Diagramme d'architecture
-  Pipeline ADF exporté (.json)
-  Package SSIS (.dtsx)
-  Scripts SQL Data Warehouse
-  Modèle SSAS (.bim)
-  Dashboard Power BI (.pbix)
-  Présentation 8–10 slides

---

##  Sécurité

> Ne jamais committer les éléments suivants sur GitHub :
> - Access Keys Azure
> - Connection Strings
> - Mots de passe SQL
> - Fichiers `.env`

---

##  Ressources

- [Documentation Azure](https://docs.microsoft.com/azure)
- [Azure Data Factory](https://docs.microsoft.com/azure/data-factory)
- [Azure Synapse Analytics](https://docs.microsoft.com/azure/synapse-analytics)
- [Power BI Documentation](https://docs.microsoft.com/power-bi)
- [SSAS Tabular](https://docs.microsoft.com/analysis-services)

---

*Projet réalisé dans le cadre de la formation Data Analyst — Mars 2025*