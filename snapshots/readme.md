### dbt snapshots 

#### Used to record changes in a mutable table overtime.

### order status values
    delivered, invoiced, shipped, processing, unavailable, canceled, created, approved

### dbt commands
    dbt snapshot

#### This strategy works by comparing a list of columns between their current and historical values. If any of these columns have changed, then dbt will invalidate the old record and record the new one.