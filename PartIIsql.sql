-- Code that takes the returned Neo4j JSON and prints it nicely onto the screen
select
	jt1.unit_name unit_name,
	jt2.unit_type unit_type,
	jt3.unit_class unit_class,
	jt4.tech tech,
	jt5.cost cost,
	jt6.notes notes
from apex_collections t,		
	json_table(t.clob001, '$.UNIT_NAME[*]' COLUMNS rid for ordinality, unit_name path '$') jt1,	
	json_table(t.clob001, '$.UNIT_TYPE[*]' COLUMNS rid for ordinality, unit_type path '$') jt2,
	json_table(t.clob001, '$.UNIT_CLASS[*]' COLUMNS rid for ordinality, unit_class path '$') jt3,	
	json_table(t.clob001, '$.TECH[*]' COLUMNS rid for ordinality, tech path '$') jt4,
	json_table(t.clob001, '$.COST[*]' COLUMNS rid for ordinality, cost int path '$') jt5,
	json_table(t.clob001, '$.NOTES[*]' COLUMNS rid for ordinality, notes path '$') jt6
where t.collection_name = 'P3_DOREST_RESULTS'
    and jt1.rid = jt2.rid and jt2.rid = jt3.rid and jt3.rid = jt4.rid and jt4.rid = jt5.rid and jt5.rid = jt6.rid
order by CASE WHEN :P3_NEW = 1 THEN unit_name
              WHEN :P3_NEW = 2 THEN unit_class
              WHEN :P3_NEW = 3 THEN unit_type
              WHEN :P3_NEW = 4 THEN tech END, unit_name