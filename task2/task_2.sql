-- drop
drop table if exists test.rdc_drycontacts_device cascade;
drop table if exists test.rdc_fom_device cascade;
drop table if exists test.rdc_harris_device cascade;
drop table if exists test.rdc_csp_device cascade;
drop table if exists test.rdc_ikm_device cascade;
drop table if exists test.rdc_rekovek_device cascade;
drop sequence if exists test.rdc_sequence cascade;

-- create
create sequence test.rdc_sequence increment 1 start 1;
create table test.rdc_drycontacts_device(id bigint not null, 
elementid bigint not null, elementparentid bigint, 
elementname character varying(255), elementpath text, 
nestinglevel int) with (oids=false);
create table test.rdc_fom_device(id bigint not null,
 elementid bigint not null, 
 elementparentid bigint,
 elementname character varying(255), 
 elementpath text, 
 nestinglevel int) with (oids=false);
create table test.rdc_harris_device(id bigint not null, 
elementid bigint not null, 
elementparentid bigint, 
elementname character varying(255), 
elementpath text, 
nestinglevel int) with (oids=false);
create table test.rdc_csp_device(id bigint not null, 
elementid bigint not null, elementparentid bigint,
 elementname character varying(255), 
 elementpath text, 
 nestinglevel int) with (oids=false);
create table test.rdc_ikm_device(id bigint not null,
 elementid bigint not null, elementparentid bigint,
 elementname character varying(255), 
 elementpath text, 
 nestinglevel int) with (oids=false);
create table test.rdc_rekovek_device(id bigint not null,
 elementid bigint not null,
 elementparentid bigint,
 elementname character varying(255),
 elementpath text, 
 nestinglevel int) with (oids=false);
 
 --INSERT 
 WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ('РЕКО-ВЕК-КаналТ','РЕКО-ВЕК-Поток-2')
	UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
	INSERT INTO test.rdc_rekovek_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;
  
WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ( 'ИКМ 7-ТМ')
 UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
INSERT INTO test.rdc_ikm_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;;
  
WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ('БТС-ЦСП-2Е2М')
UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
	INSERT INTO test.rdc_csp_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;
  
WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ( 'Harris 20-20')
 UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
	INSERT INTO test.rdc_harris_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;
WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ('FG-FOM4-MR','FG-FOM-16OG-L')
 UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
	INSERT INTO test.rdc_fom_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;
  
WITH RECURSIVE sub_rdc_agents (id,parentid,agentElementType,agentelementname,agentType,level, elementpath) AS(
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			cast(0 as int) AS level,
			cast(rdc.id as text) as elementpath  
	FROM test.rdc_agents rdc
		WHERE agenttype IN ('dukGenericDryContacts')
 UNION
	SELECT rdc.id,
			rdc.parentid,
			rdc.agentElementType,
			rdc.agentelementname,
			rdc.agentType,
			srdc.level + 1,
			srdc.elementpath || '/' || rdc.id
	FROM test.rdc_agents rdc 
	JOIN
	sub_rdc_agents srdc ON rdc.parentid = srdc.id )
	INSERT INTO test.rdc_drycontacts_device(id,nestinglevel, elementpath,elementid,elementparentid,elementname)
		select 
			nextval('test.rdc_sequence'),
				srdc.level,
				srdc.elementpath,
				srdc.id, 
				srdc.parentid,
				srdc.agentelementname FROM sub_rdc_agents srdc;