INSERT INTO TAG (ID, NAME) VALUES
                               (CAST('10000000-0000-4000-8000-000000000001' AS UUID), 'Drama'),
                               (CAST('10000000-0000-4000-8000-000000000002' AS UUID), 'Mystery'),
                               (CAST('10000000-0000-4000-8000-000000000003' AS UUID), 'Sci-Fi'),
                               (CAST('10000000-0000-4000-8000-000000000004' AS UUID), 'Adventure'),
                               (CAST('10000000-0000-4000-8000-000000000005' AS UUID), 'Comedy'),
                               (CAST('10000000-0000-4000-8000-000000000006' AS UUID), 'Thriller'),
                               (CAST('10000000-0000-4000-8000-000000000007' AS UUID), 'Fantasy'),
                               (CAST('10000000-0000-4000-8000-000000000008' AS UUID), 'Romance');

INSERT INTO MOVIE (ID, TITLE, RELEASE_DATE) VALUES
                                                (CAST('20000000-0000-4000-8000-000000000001' AS UUID), 'The Last Lighthouse', DATE '2018-04-13'),
                                                (CAST('20000000-0000-4000-8000-000000000002' AS UUID), 'Orbit Seven', DATE '2021-09-24'),
                                                (CAST('20000000-0000-4000-8000-000000000003' AS UUID), 'Midnight Delivery', DATE '2016-10-07'),
                                                (CAST('20000000-0000-4000-8000-000000000004' AS UUID), 'The Glass Forest', DATE '2020-06-19'),
                                                (CAST('20000000-0000-4000-8000-000000000005' AS UUID), 'A Quiet Harbour', DATE '2014-03-28'),
                                                (CAST('20000000-0000-4000-8000-000000000006' AS UUID), 'Signal Lost', DATE '2023-11-03'),
                                                (CAST('20000000-0000-4000-8000-000000000007' AS UUID), 'The Bakers Secret', DATE '2019-02-15'),
                                                (CAST('20000000-0000-4000-8000-000000000008' AS UUID), 'Beneath the Ice', DATE '2017-12-01'),
                                                (CAST('20000000-0000-4000-8000-000000000009' AS UUID), 'Summer in October', DATE '2022-05-20'),
                                                (CAST('20000000-0000-4000-8000-000000000010' AS UUID), 'The Ninth Doorbell', DATE '2015-08-14');

INSERT INTO MOVIE_TAG (MOVIE_ID, TAG_ID) VALUES
                                             (CAST('20000000-0000-4000-8000-000000000001' AS UUID), CAST('10000000-0000-4000-8000-000000000001' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000001' AS UUID), CAST('10000000-0000-4000-8000-000000000002' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000002' AS UUID), CAST('10000000-0000-4000-8000-000000000003' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000002' AS UUID), CAST('10000000-0000-4000-8000-000000000004' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000003' AS UUID), CAST('10000000-0000-4000-8000-000000000005' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000003' AS UUID), CAST('10000000-0000-4000-8000-000000000002' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000004' AS UUID), CAST('10000000-0000-4000-8000-000000000007' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000004' AS UUID), CAST('10000000-0000-4000-8000-000000000004' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000005' AS UUID), CAST('10000000-0000-4000-8000-000000000001' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000005' AS UUID), CAST('10000000-0000-4000-8000-000000000008' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000006' AS UUID), CAST('10000000-0000-4000-8000-000000000003' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000006' AS UUID), CAST('10000000-0000-4000-8000-000000000006' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000007' AS UUID), CAST('10000000-0000-4000-8000-000000000005' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000007' AS UUID), CAST('10000000-0000-4000-8000-000000000002' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000008' AS UUID), CAST('10000000-0000-4000-8000-000000000004' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000008' AS UUID), CAST('10000000-0000-4000-8000-000000000006' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000009' AS UUID), CAST('10000000-0000-4000-8000-000000000008' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000009' AS UUID), CAST('10000000-0000-4000-8000-000000000005' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000010' AS UUID), CAST('10000000-0000-4000-8000-000000000002' AS UUID)),
                                             (CAST('20000000-0000-4000-8000-000000000010' AS UUID), CAST('10000000-0000-4000-8000-000000000006' AS UUID));
-- Add 1,000 movies with distinct titles and dates.
INSERT INTO MOVIE (ID, TITLE, RELEASE_DATE)
SELECT
    CAST(
            '30000000-0000-4000-8000-' ||
            LPAD(CAST(X AS VARCHAR), 12, '0')
        AS UUID
    ),
    CASE MOD(X, 10)
        WHEN 0 THEN 'Beyond the Horizon'
        WHEN 1 THEN 'The Silent City'
        WHEN 2 THEN 'Echoes of Tomorrow'
        WHEN 3 THEN 'Letters from Winter'
        WHEN 4 THEN 'The Forgotten Island'
        WHEN 5 THEN 'Midnight Expressway'
        WHEN 6 THEN 'Under Crimson Skies'
        WHEN 7 THEN 'The Clockwork Garden'
        WHEN 8 THEN 'A Thousand Departures'
        WHEN 9 THEN 'Secrets of the Harbour'
        END || ' ' || LPAD(CAST(X AS VARCHAR), 4, '0'),
    DATEADD('DAY', MOD(X * 37, 15000), DATE '1980-01-01')
FROM SYSTEM_RANGE(1, 1000);

-- Assign 1–3 distinct existing tags to each generated movie.
INSERT INTO MOVIE_TAG (MOVIE_ID, TAG_ID)
SELECT
    CAST(
            '30000000-0000-4000-8000-' ||
            LPAD(CAST(M.X AS VARCHAR), 12, '0')
        AS UUID
    ),
    CAST(
            '10000000-0000-4000-8000-' ||
            LPAD(CAST(MOD(M.X + T.X * 3, 8) + 1 AS VARCHAR), 12, '0')
        AS UUID
    )
FROM SYSTEM_RANGE(1, 1000) M
         CROSS JOIN SYSTEM_RANGE(0, 2) T
WHERE T.X < 1 + MOD(M.X, 3);