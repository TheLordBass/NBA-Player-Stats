# 🏀 NBA Trends & Performance Analysis (1996-2023)

### 🚀 Executive Summary
**Goal:** Analyze 25+ years of NBA data to quantify the evolution of the "Small Ball" era, evaluate scoring efficiency at high volumes, and identify the league's top talent-producing franchises.
**Role:** Data Analyst.
**Tools:** SQL (Window Functions, CTEs, Aggregations), Excel.

---

## 📖 The Story
The NBA has undergone a dramatic transformation over the last two decades. The "eye test" suggests the game is faster, players are smaller, and scoring is more efficient than ever.

I wanted to back these observations with **hard data**. Using **SQL**, I analysed over 12,000 player seasons from 1996 to 2023 to mathematically prove how the physics and economics of the game have changed.

---

## 🔍 Key Questions & Insights

### 1. Do "Ball Hogs" Hurt Efficiency?
* **The Hypothesis:** High-usage players (volume scorers) are less efficient due to defensive focus and fatigue.
* **The SQL Approach:** I compared **Usage Percentage (`usg_pct`)** against **True Shooting Percentage (`ts_pct`)** for players with >40 games played.
* **The Insight:** The data disproves the hypothesis. The "Elite" tier of players (>30% Usage) actually maintains the **highest** average True Shooting % of any group. Superstars like Steph Curry and Kevin Durant defy the volume-efficiency trade-off entirely.

### 2. Is the "Small Ball" Era Real?
* **The Hypothesis:** Players are getting smaller as teams prioritise shooting over size.
* **The SQL Approach:** I calculated the average height and weight of players per season using `GROUP BY` and `AVG()`.
* **The Insight:** Confirmed. Since 2015, average player weight has dropped by **~5kg** and height by **~3cm**.
    * *Note:* The data shows a sharp drop in 2019, which correlates with the NBA changing its policy to measure players without shoes—a crucial context for accurate analysis.

### 3. Which Teams are the "Talent Factories"?
* **The Hypothesis:** Certain organisations are better at scouting and developing elite scorers.
* **The SQL Approach:** I used a **Common Table Expression (CTE)** and **Window Functions** to rank the top 15 scorers of every season, then aggregated them by team.
* **The Insight:** The **Oklahoma City Thunder (OKC)**, **LA Lakers (LAL)**, and **Golden State Warriors (GSW)** are the dominant franchises, each producing over
