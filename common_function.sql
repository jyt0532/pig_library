DEFINE A_REMOVE_B(setA, setB) RETURN REMOVED {
	A_LJ_B = JOIN A BY (user_query, query_type) LEFT,
		      B BY (user_query, query_type);
	filter_A_LJ_B = FILTER A_LJ_B BY
			A::user_query IS NOT NULL AND
			B::user_query IS NULL;
	$REMOVED = FOREACH filter_A_LJ_B GENERATE
			A::user_query AS user_query,
			A::query_type AS query_type; 	
}

