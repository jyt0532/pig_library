DEFINE A_REMOVE_B(setA, setB) RETURNS REMOVED {
        A_LJ_B = JOIN $setA BY (user_query, query_type) LEFT,
                      $setB BY (user_query, query_type);
        filter_A_LJ_B = FILTER A_LJ_B BY
                        $setA::user_query IS NOT NULL AND
                        $setB::user_query IS NULL;
        $REMOVED = FOREACH filter_A_LJ_B GENERATE
                        $setA::user_query AS user_query,
                        $setA::query_type AS query_type;
};
