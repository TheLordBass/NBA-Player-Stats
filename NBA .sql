--1.Player Performance Analysis

-- Ranking players in each season by points, rebounds, assists per game.
SELECT 
    season,
    player_name,
    pts,
    RANK() OVER (PARTITION BY season ORDER BY pts DESC) as pts_rank,
    reb,
    RANK() OVER (PARTITION BY season ORDER BY reb DESC) as reb_rank,
    ast,
    RANK() OVER (PARTITION BY season ORDER BY ast DESC) as ast_rank
FROM 
    STATS
ORDER BY 
    season DESC, 
    pts_rank ASC;

-- Comparing efficiency stats (TS% vs usage%) to see if volume scorers are efficient

SELECT 
    player_name,
    season,
    usg_pct,
    ts_pct,
    pts
FROM 
    STATS
WHERE 
    gp >= 40 
    AND usg_pct > 0.30  -- High Volume
    AND ts_pct > 0.60   -- High Efficiency
ORDER BY 
    pts DESC

    -- The common assumption is that as a player takes more shots (higher usage), their efficiency drops due to fatigue and defensive pressure. However, the data tells a different story: Volume scorers are actually the most efficient players


   -- 2. Era & Team Comparisons


   -- Comparing average player size (height/weight) over the seasons
   SELECT 
        season,
        ROUND(AVG(player_height),2) as avg_height,
        ROUND(AVG(player_weight),2) as avg_weight

    From STATS
    GROUP BY season
    order by 1 desc

    -- Since 2015, the average player weight has dropped by ~5 kg and height by ~3 cm. This aligns perfectly with the "Small Ball" era, where teams began prioritising speed and shooting over raw physical size, there is a sudden drop in 2019 as the NBA changed the rules to measure players without shoes.

    --Identifing which teams consistently produce top-performing players

    WITH RankedPlayers AS (
    SELECT 
        season,
        team_abbreviation,
        player_name,
        pts,
        RANK() OVER (PARTITION BY season ORDER BY pts DESC) as scoring_rank
    FROM STATS
)
SELECT 
    team_abbreviation,
    COUNT(*) as num_top_performers
FROM RankedPlayers
WHERE scoring_rank <= 15 AND team_abbreviation IS NOT NULL
GROUP BY team_abbreviation
ORDER BY num_top_performers DESC

-- From the results we can sse that OKC, LAL and GSW afe the best at producing the top performing talent with over 20 top scoring players producced

