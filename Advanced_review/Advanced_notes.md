## OVERVIEW

Reviewed advanced SQL topics including Common Table Expressions (CTEs), stored procedures, temporary tables, triggers, and scheduled events. These tools are essential for building scalable, automated, and maintainable data workflows.

---

## KEY MISTAKES

- **CTE not followed by a SELECT**: A `WITH` clause must be immediately followed by a main query.
- **Improper delimiter use in stored procedures**: Remember to change the delimiter when creating procedures to avoid syntax errors.
- **Forgetting to drop or reuse temp tables**: Temp tables persist for the session—check if one already exists before creating.
- **Trigger logic errors**: Ensure `NEW` and `OLD` values are used correctly in `BEFORE` and `AFTER` triggers.
- **Events not running**: Common mistake is the event scheduler being off (`SET GLOBAL event_scheduler = ON`).

---

## TIPS

- Use **CTEs** to simplify nested subqueries and improve readability.
- **Stored procedures** are great for encapsulating business logic—use them for repeatable tasks.
- Always include `IF EXISTS` or `IF NOT EXISTS` for temp tables to prevent crashes.
- Add `DELIMITER $$` and `DELIMITER ;` properly when defining procedures or triggers.
- **Triggers** should be tested carefully—they can silently impact data integrity.
- Use **events** for scheduled jobs like data archiving or cleanup—make sure they're enabled!

---

## USE CASES

- **CTEs**: Clean and readable way to break complex logic into steps.
- **Stored Procedures**: Automate processes like monthly reporting or data transformation tasks.
- **Temp Tables**: Store intermediate results within a session, especially during multi-step queries.
- **Triggers**: Automatically update audit tables, enforce rules, or sync related tables on insert/update/delete.
- **Events**: Schedule periodic tasks directly within the database (e.g., daily data refresh).

---
