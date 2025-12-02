# Diagrama de la Red del Metro de Bilbao

Generado automáticamente desde datos abiertos (Open Data).

## 🗺️ Topología de la Red

```mermaid
graph LR
    %% Línea 1 - Plentzia ↔ Etxebarri
    subgraph L1["🔵 Línea 1 - Plentzia ↔ Etxebarri"]
        PLE[Plentzia] --> SOP[Sopelana]
        SOP --> URD[Urduliz]
        URD --> LAR[Larrabasterra]
        LAR --> BER[Berango]
        BER --> IBB[Ibarbengoa]
        IBB --> NEG[Neguri]
        NEG --> GOB[Gobela]
        GOB --> ARE[Areeta]
        ARE --> LAM[Lamiako]
        LAM --> LEI[Leioa]
        LEI --> AST[Astrabudua]
        AST --> ERA[Erandio]
        ERA --> LUT[Lutxana]
        LUT --> ANS[Ansio]
        ANS --> GUR[Gurutzeta]
        GUR --> BAR[Barakaldo]
        BAR --> BAG[Bagatza]
        BAG --> SAN[San Inazio]
        SAN --> BAS[Basarrate]
        BAS --> BOL[Bolueta]
        BOL --> ETX[Etxebarri]
        ETX --> ARZ[Ariz]
        ARZ --> BSR[Bolueta Sur]
    end
    
    %% Línea 2 - Kabiezes ↔ Basauri
    subgraph L2["🟠 Línea 2 - Kabiezes ↔ Basauri"]
        KAB[Kabiezes] --> STZ[Santurtzi]
        STZ --> POR[Portugalete]
        POR --> ABT[Abatxolo]
        ABT --> SES[Sestao]
        SES --> URB[Urbinaga]
        URB --> BAG2[Bagatza]
        BAG2 --> BAR2[Barakaldo]
    end
    
    %% Línea 3 (Extensiones)
    subgraph L3["🟢 Extensiones / Accesos"]
        AIB[Aiboa] --> ALG[Algorta]
        ALG --> BID[Bidezabal]
    end
    
    %% Nodos principales (intercambiadores)
    ABA[🚉 Abando<br/>Interchange]
    MOY[Moyua]
    IND[Indautxu]
    SAM[San Mamés]
    DEU[Deusto]
    SAR[Sarriko]
    SIN[Santutxu]
    
    %% Conexiones del centro
    ABA --> MOY --> IND --> SAM --> DEU --> SAR --> SIN
    
    %% Estilos
    style L1 fill:#e3f2fd,stroke:#1976d2,stroke-width:2px
    style L2 fill:#fff3e0,stroke:#f57c00,stroke-width:2px
    style L3 fill:#e8f5e9,stroke:#388e3c,stroke-width:2px
    style ABA fill:#ffeb3b,stroke:#f57f17,stroke-width:3px
    style BAG fill:#ffeb3b,stroke:#f57f17,stroke-width:2px
    style BAR fill:#ffeb3b,stroke:#f57f17,stroke-width:2px
```

---

## 📊 Estadísticas de la Red

| Métrica | Valor |
|---------|-------|
| **Total de estaciones** | 49 estaciones físicas |
| **Total de accesos** | 123 puntos de entrada/salida |
| **Líneas operativas** | 2 líneas principales (L1, L2) |
| **Zonas tarifarias** | 3 zonas (Centro, Intermedia, Exterior) |
| **Longitud aproximada** | ~43 km de red |

---

## 🎯 Estaciones con Mayor Complejidad

Estaciones con **4 o más accesos** (ascensores, entradas, conexiones):

| Estación | Accesos | Tipo |
|----------|---------|------|
| **Abando (ABA)** | 4 | Ascensor, Berastegi, Gran Vía, RENFE |
| **Barakaldo (BAR)** | 4 | Ascensor, Elkano, Foruak, Euskadi |
| **Bagatza (BAG)** | 3 | Ascensor, Gabriel Aresti, Santa Teresa |
| **Santurtzi (STZ)** | 4 | Ascensor, Las Viñas, Casa Torre, Mamariga |

---

## 🚇 Principales Intercambiadores

```mermaid
graph TD
    A[🚉 Abando] -->|L1| B[San Mamés]
    A -->|Cercanías RENFE| C[Bilbao-Abando]
    A -->|Conexión| D[Moyua]
    
    B -->|L1 & L2| E[Barakaldo]
    B -->|Conexión| F[Deusto]
    
    E -->|L1 Plentzia| G[Plentzia]
    E -->|L1 Etxebarri| H[Etxebarri]
    E -->|L2 Kabiezes| I[Kabiezes]
    
    style A fill:#ffd54f
    style B fill:#ffd54f
    style E fill:#ffd54f
```

---

## 📍 Coordenadas GPS de Estaciones Clave

| Estación | Latitud | Longitud | Zona |
|----------|---------|----------|------|
| Plentzia | 43.40183 | -2.94640 | 3 |
| Abando | 43.26144 | -2.92820 | 1 |
| San Mamés | 43.26254 | -2.94819 | 1 |
| Barakaldo | 43.29531 | -2.98890 | 2 |
| Etxebarri | 43.24387 | -2.89668 | 1 |
| Kabiezes | 43.32231 | -3.03661 | 2 |

---

## 🛠️ Generado con:

- **Fuente**: Open Data Metro Bilbao (`estaciones.csv`)
- **Herramienta**: GitHub Copilot + Mermaid.js
- **Formato**: GTFS (General Transit Feed Specification)

**💡 Este diagrama fue generado automáticamente analizando 123 registros del CSV oficial en menos de 1 minuto.**
