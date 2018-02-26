WITH sub_channel (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_channel_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_channel c ON c.parentid=chg.id),

sub_contractor (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_contractor_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_contractor c ON c.parentid=chg.id),
sub_direction (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_direction_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_direction c ON c.parentid=chg.id),
sub_modem (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_modem_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_modem c ON c.parentid=chg.id),
sub_sensor (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_sensor_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_sensor c ON c.parentid=chg.id),
sub_slot (device_name,module_group_name,module_name, component_group_name,component_name) as (
SELECT d.elementname,
	mg.elementname,
	m.elementname,
	chg.elementname,
	c.elementname
	FROM test.rekovek_device d
	LEFT JOIN test.rekovek_module_group mg ON mg.parentid=d.id
	LEFT JOIN test.rekovek_module m ON m.parentid = mg.id
	LEFT JOIN test.rekovek_slot_group chg ON chg.parentid=m.id
	LEFT JOIN test.rekovek_slot c ON c.parentid=chg.id)
	
	SELECT * FROM sub_channel
	UNION
	SELECT * FROM sub_contractor
	UNION
	SELECT * FROM sub_direction
	UNION
	SELECT * FROM sub_modem
	UNION
	SELECT * FROM sub_sensor
	UNION
	SELECT * FROM sub_slot;