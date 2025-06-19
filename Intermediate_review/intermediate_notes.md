## OVERVIEW

Reviewed intermediate SQL concepts including `CASE`, `JOINS`, string functions, subqueries, `UNION`s, and window functions. These are powerful tools for transforming and analyzing data across real-world scenarios.

---

## KEY MISTAKES

- **Forgetting to alias subqueries**: Every subquery needs an alias, even if it's not used.
- **Confusing INNER and OUTER JOINS**: Be clear on the differences and when to use each.
- **Mixing up UNION vs UNION ALL**: `UNION` removes duplicates, `UNION ALL` does not.
- **CASE syntax errors**: Common mistake is missing the `END` keyword or incorrect order of WHEN-THEN clauses.
- **Window functions without OVER() clause**: Every window function needs an `OVER()` clause, even if it's empty.

---

## TIPS

- Use aliases (`AS`) generously for subqueries and complex expressions for readability.
- Break long queries into multiple lines with indentation to follow logic easily.
- Add comments above JOINs and subqueries if the logic gets dense.
- Practice writing `CASE` statements in both `SELECT` and `ORDER BY` clauses.
- For window functions, clearly define your partitioning and ordering logic.

---

## USE CASES

- **CASE**: Conditional logic in queries—useful for data categorization.
- **JOINS**: Combine multiple tables—essential for relational databases.
- **String Functions**: Clean, parse, and transform text (e.g., `CONCAT`, `SUBSTRING`, `TRIM`).
- **Subqueries**: Use when filtering based on results from other queries.
- **UNIONs**: Stack data from multiple queries/tables with the same structure.
- **Window Funct