SELECT titleType, COUNT(*) AS typeCount
FROM title_basics
GROUP BY titleType
ORDER BY typeCount DESC;

