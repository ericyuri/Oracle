-- It counts the weekdays from today when given a specific day.
SELECT
    d
FROM
    (
        SELECT
            d,
            ROWNUM rn
        FROM
            (
                SELECT
                    sysdate + ( ( level ) * abs(:p_offset) / :p_offset )         d,
                    to_char(sysdate +(level), 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') AS target_day
                FROM
                    dual
                CONNECT BY
                    level <= abs(:p_offset) * 2
            )
        WHERE
            target_day NOT IN ( 'SAT', 'SUN' )
    )
WHERE
    rn = abs(:p_offset);
