with iterator as (
 select level - 1 num, substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', level, 1) digit  -- A TO Z
 from dual
 connect by level <= 26 -- could be length(<digits string>) instead of 26
)
select a.digit||b.digit||c.digit||d.digit||e.digit as digitval
      ,a.num * power(26, 4) + b.num * power(26, 3) + c.num * power(26, 2) + d.num * power(26, 1) + e.num * power(26, 0) decval -- sequence
from iterator a
cross join iterator b
cross join iterator c
cross join iterator d
cross join iterator e