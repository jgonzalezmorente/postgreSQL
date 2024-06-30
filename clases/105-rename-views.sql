SELECT * FROM comments_per_week;

ALTER VIEW comments_per_week RENAME to posts_per_week;

SELECT * FROM comments_per_week_mat;

ALTER MATERIALIZED VIEW comments_per_week_mat RENAME TO posts_per_week_mat;